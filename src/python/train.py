import os
import torch
import argparse
from torch import nn
from torchvision.datasets import MNIST
from torch.utils.data import DataLoader, ConcatDataset, SubsetRandomSampler
from torchvision import transforms

from sklearn.model_selection import KFold
import matplotlib.pyplot as plt


# Import dataset
_data_root = os.path.join(os.path.dirname(__file__), '../../data')
dataset_train_part = MNIST(
    _data_root, download=False, transform=transforms.ToTensor(), train=True)
dataset_test_part = MNIST(
    _data_root, download=False, transform=transforms.ToTensor(), train=False)


# Set number of threads for CPU to 1
torch.set_num_threads(1)


def train_model(network, trainloader, optimizer, loss_function, num_epochs, device):
    # Function to perform the training.
    for epoch in range(num_epochs):
        print(f'Starting epoch {epoch + 1}')
        current_loss = 0.0

        for i, data in enumerate(trainloader, 0):
            inputs, targets = data
            inputs, targets = inputs.to(device), targets.to(device)
            optimizer.zero_grad()
            outputs = network(inputs)
            loss = loss_function(outputs, targets)
            loss.backward()
            optimizer.step()
            current_loss += loss.item()

            if i % 500 == 499:
                print(
                    'Loss after mini-batch %5d: %.3f' %
                     (i + 1, current_loss / 500)
                )
                current_loss = 0.0


def test_model(network, testloader, device):
   # Function to test the model on the test set for a fold
    correct, total = 0, 0

    with torch.no_grad():
        for i, data in enumerate(testloader, 0):
            inputs, targets = data
            inputs, targets = inputs.to(device), targets.to(device)
            outputs = network(inputs)
            _, predicted = torch.max(outputs.data, 1)
            total += targets.size(0)
            correct += (predicted == targets).sum().item()

    accuracy = 100.0 * correct / total
    print(f'Accuracy: {accuracy:.2f}%')
    return accuracy


def k_fold_cross_validation(k_folds, num_epochs, loss_function, device):
    # Function to perform k-fold cross-validation
    results = {}
    dataset = ConcatDataset([dataset_train_part, dataset_test_part])
    kfold = KFold(n_splits=k_folds, shuffle=True)

    for fold, (train_ids, test_ids) in enumerate(kfold.split(dataset)):
        print(f'FOLD {fold}')
        print('--------------------------------')

        train_subsampler = SubsetRandomSampler(train_ids)
        test_subsampler = SubsetRandomSampler(test_ids)

        trainloader = DataLoader(
            dataset, batch_size=10, sampler=train_subsampler)
        testloader = DataLoader(
            dataset, batch_size=10, sampler=test_subsampler)

        network = CNN(in_channels=1, num_classes=10).to(device)
        network.apply(reset_weights)
        optimizer = torch.optim.Adam(network.parameters(), lr=1e-4)

        train_model(network, trainloader, optimizer, loss_function, num_epochs, device)

        print('Training process has finished. Saving trained model.')
        print('Starting testing')

        save_path = f'./model-fold-{fold}.pth'
        torch.save(network.state_dict(), save_path)

        accuracy = test_model(network, testloader, device)
        results[fold] = accuracy
        print('--------------------------------')

    return results

# Function to print k-fold cross-validation results
def print_results(results):
    print(f'K-FOLD CROSS VALIDATION RESULTS FOR {len(results)} FOLDS')
    print('--------------------------------')

    total_accuracy = sum(results.values())
    average_accuracy = total_accuracy / len(results)

    for key, value in results.items():
        print(f'Fold {key}: {value:.2f}%')

    print(f'Average: {average_accuracy:.2f}%')



# Main function
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--device', type=str, default='cpu', choices=['cpu', 'cuda'])
    args = parser.parse_args()
    device = torch.device(args.device)

    # then pass device through to your functions
    results = k_fold_cross_validation(k_folds, num_epochs, loss_function, device, ...)