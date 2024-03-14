---
layout: page
toc: true
title: "Beyond the Angle: the Complexities of Cosine Similarity"
date: 2024-03-14 21:44:23 +0200
categories: blog
---

Cosine similarity is a widely used measure for determining semantic similarity between high-dimensional objects, particularly in fields such as language models and recommender systems. It operates on the principle of measuring the cosine of the angle between two vectors, effectively their normalized dot product.

![Cosine Similarity](https://miro.medium.com/v2/resize:fit:915/1*dyH20eCqb6qTL-gt4nCVzQ.png "Cosine Similarity")

However, a [recent paper](https://arxiv.org/html/2403.05440v1) from Netflix presents a critical viewpoint. While acknowledging the successes of cosine similarity in various applications, the paper highlights its potential to yield inconsistent or less effective results compared to unnormalized dot products.

The authors delve into this issue analytically, focusing on embeddings derived from regularized linear models, especially matrix factorization models, where closed-form solutions are available. They uncover that cosine similarity can lead to arbitrary and even meaningless results. Several factors contribute to this:

1. **Freedom in Embeddings**: The creation of points or embeddings involves a degree of flexibility. Consequently, different methodologies can produce varying sets of points for the same objects, leading to inconsistent results.

2. **Impact of Regularization**: Regularization, a technique to streamline models and avoid overfitting, can unpredictably affect embeddings. The choice of regularization method may alter the embeddings, thereby influencing the outcomes of cosine similarity.

3. **Sensitivity to Scaling**: The measure is susceptible to how vectors are scaled in space. The magnitude or length of vectors, despite representing the same underlying relationships, can skew cosine similarity results.

4. **Normalization Variabilities**: A crucial step in cosine similarity is vector length adjustment for comparability. However, the approach to normalization can differ, potentially impacting similarity assessments in unpredictable ways.

Therefore, while cosine similarity has its merits, these factors underscore the need for caution in its application, as it may not always reliably reflect true similarities.