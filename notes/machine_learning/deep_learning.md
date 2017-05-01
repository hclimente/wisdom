We want to learn a function.

Deep-learning methods are representation-learning methods with multiple levels of representation, obtained by composing simple but non-linear modules that each transform the representation at one level (starting with the raw input) into a representation at a higher, slightly more abstract level. Features provide a representation of the object we want to classify. Designing features might be the most difficult and most important aspect of machine learning. That's where the power of deep learning lies: transformations on the features are not engineered by humans, but learned from the raw data using a general-purpose learning algorithm. Every layer amplify the aspects of the input that are important for discrimination, and remove irrelevant variance.

# Deep learning as a supervised learning process

In a deep neural network, the parameters that define the input-output function are called weights. These are what we want to adjust. To do so, we compute an objective function, which measures the distance between the desired and the obtained scores. This function, averaged over all training examples, defines a hilly landscape along the highly-dimensional space of weight values. In consequence, following the gradient we will find a minimum, where the average output error is low. Generally this is done through stochastic gradient descent (SGD), which consists on:

1. Select a few input vectors.
2. Compute outputs and errors.
3. Compute the average gradient for those examples.
4. Adjust the weights.
5. Repeat until the average objective function stops decreasing.

Afterwards, test the generalization on a test set.

## Shallow-classifiers

Linear classifiers can only handle simple classification problems ie half-spaces separated by an hyperplane. In consequence, they require a good feature extractor, one that solves the selectivity-invariance dilemma: produces representations that are selective to the parts of the image that are important for classification, while are invariant to the irrelevant aspects. In front of this, we can try to learn an appropriate kernel (usually don't generalize well); or to invest a good deal of time and expertise on designing a good feature extractor. The whole deal can be avoided by using deep learning, which learns the good features from the data.

# References

* LeCun, Y., Bengio, Y., & Hinton, G. (2015). Deep learning. Nature, 521(7553), 436–444. https://doi.org/10.1038/nature14539
