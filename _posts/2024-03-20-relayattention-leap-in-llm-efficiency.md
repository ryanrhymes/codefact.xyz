---
layout: post
toc: true
title: "RelayAttention Can Boost LLM Efficiency by 2X"
date: 2024-03-20 20:05:00 +0200
categories: blog
---

The advent of Large Language Models (LLMs) like GPT-4 and Gemini has ushered in a new era of digital assistance, from coding aids to chat interfaces. Yet, as these models grow in scope and sophistication, their operational efficiency—particularly concerning inference throughput and latency. This issue is especially pronounced for LLM services that utilize extensive system prompts to refine response quality or enforce ethical guidelines. The primary inefficiency stems from the causal attention mechanism, where the repetitive transfer of cached hidden states across memory significantly slows response generation.

![Attention Mechanism](https://www.researchgate.net/publication/354542656/figure/fig3/AS:1067437764145154@1631508403847/Attention-Mechanism-Comparison-Causal-models-are-often-supervised-to-predict-the.ppm "Attention Mechanism")

Addressing this bottleneck, the [RelayAttention algorithm](https://arxiv.org/abs/2402.14808) emerges as a notable innovation aimed at enhancing LLM service efficiency. The algorithm's success lies in its foundation; it modifies the memory access pattern without altering the computational integrity of the causal attention process. By transforming matrix-vector into matrix-matrix multiplications, the algorithm allows one-time loading of cached hidden states for a batch of requests, which further minimizes unnecessary memory access, thereby expediting the inference process without compromising on model performance. Therefore, RelayAttention reduces the need for multiple DRAM to SRAM data transfers for each request.

The practical implications of RelayAttention are substantial. It promises a direct improvement in request handling rates and throughput for various LLMs, demonstrated by empirical results showing up to 2.2× increase in sustainable request rates and 2.0× throughput enhancements. This optimization is particularly vital as system prompts grow in length to accommodate more intricate applications.