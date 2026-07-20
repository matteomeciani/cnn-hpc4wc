#include "include/cnn.h"
#include "include/cnn_internals.h"

void cnn_baseline( CNNContext& ctx ) {
    conv2d_forward(ctx.input_batch, ctx.conv1_weight, ctx.conv1_bias, ctx.conv1_out, 1, 0);
    relu_forward(ctx.conv1_out);
    maxpool2d_forward(ctx.conv1_out, ctx.pool1_out, 2, 2);

    conv2d_forward(ctx.pool1_out, ctx.conv2_weight, ctx.conv2_bias, ctx.conv2_out, 1, 0);
    relu_forward(ctx.conv2_out);
    maxpool2d_forward(ctx.conv2_out, ctx.pool2_out, 2, 2);

    conv2d_forward(ctx.pool2_out, ctx.conv3_weight, ctx.conv3_bias, ctx.conv3_out, 1, 0);
    relu_forward(ctx.conv3_out);
    adaptive_avgpool2d_forward(ctx.conv3_out, ctx.avgpool_out);

    linear_forward(ctx.avgpool_out, ctx.fc_weight, ctx.fc_bias, ctx.final_logits);
}


void cnn_baseline_autovec( CNNContext& ctx ) {
    conv2d_forward_noboundcheck(ctx.input_batch, ctx.conv1_weight, ctx.conv1_bias, ctx.conv1_out, 1, 0);
    relu_forward(ctx.conv1_out);
    maxpool2d_forward(ctx.conv1_out, ctx.pool1_out, 2, 2);

    conv2d_forward_noboundcheck(ctx.pool1_out, ctx.conv2_weight, ctx.conv2_bias, ctx.conv2_out, 1, 0);
    relu_forward(ctx.conv2_out);
    maxpool2d_forward(ctx.conv2_out, ctx.pool2_out, 2, 2);

    conv2d_forward_noboundcheck(ctx.pool2_out, ctx.conv3_weight, ctx.conv3_bias, ctx.conv3_out, 1, 0);
    relu_forward(ctx.conv3_out);
    adaptive_avgpool2d_forward(ctx.conv3_out, ctx.avgpool_out);

    linear_forward(ctx.avgpool_out, ctx.fc_weight, ctx.fc_bias, ctx.final_logits);
}