import keras
from keras import ops
import keras_cv
from matplotlib.pyplot import show
import numpy as np

from keras_cv.datasets.pascal_voc.segmentation import load as load_voc

model = keras_cv.models.DeepLabV3Plus.from_preset(
    "deeplab_v3_plus_resnet50_pascalvoc",
    num_classes=21,
    input_shape=[512, 512, 3],
)

image = keras.utils.load_img("/home/lukas/Downloads/gCNcJJI.jpeg")

resize = keras_cv.layers.Resizing(height=512, width=512)
image = resize(image)
image = keras.ops.expand_dims(np.array(image), axis=0)
preds = ops.expand_dims(ops.argmax(model(image), axis=-1), axis=-1)
keras_cv.visualization.plot_segmentation_mask_gallery(
    image,
    value_range=(0, 255),
    num_classes=1,
    y_true=None,
    y_pred=preds,
    scale=3,
    rows=1,
    cols=1,
    show=True
)
