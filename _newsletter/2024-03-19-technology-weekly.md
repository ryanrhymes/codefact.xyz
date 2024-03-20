---
layout: default
toc: true
title: "Technology Weekly: March 10-16, 2024"
date: 2024-03-19 23:29:00 +0200
bodyClass: "page-basic"

selected_posts:
  - path: _posts/2024-03-16-ai-diversity-regulation.md
  - path: _posts/2024-03-14-forgetting-technique.md
  - path: _posts/2024-03-14-multi-agent-ai.md
  - path: _posts/2024-03-15-llm-capabilities.md
  - path: _posts/2024-03-14-matrix-multiplication.md
  - path: _posts/2024-03-14-beyond-the-angle.md
  - path: _posts/2024-03-16-enhanced-lll-algorithm.md
  - path: _posts/2024-03-15-sima-gaming-discussion.md
  - path: _posts/2024-03-15-apple-darwin-ai.md
  - path: _posts/2024-03-15-databricks-mistral-partnership.md
  - path: _posts/2024-03-15-zscaler-avalor-ma.md
  - path: _posts/2024-03-16-empowering-ai-startup.md
  - path: _posts/2024-03-15-ethics-in-creative-industries.md
  - path: _posts/2024-03-16-ai-bioweapon.md
  - path: _posts/2024-03-15-quantum-computing.md
  - path: _posts/2024-03-16-india-reverse-ai-regulation.md
  - path: _posts/2024-03-16-warpstream-cloud-native-streaming.md
---

<div class="container pb-6 pt-6 pt-md-10 pb-md-10">
    <div class="row justify-content-start">
        <div class="col-12">
            <div class="service service-single">
                <h2 class="title" style="margin-bottom:1em">{{page.title}}</h2>

                <!-- Editor's Note -->
                <h2>Editor's Note</h2>
                <hr style="margin-bottom: 1em;" />

                <p style="font-style: italic;">
                This week's newsletter delves into the dynamic world of AI, spotlighting Timnit Gebru's advocacy for ethics and diversity in tech, alongside cutting-edge developments from adaptive learning techniques to quantum computing breakthroughs. Highlighting strategic industry shifts, like Apple's acquisition of DarwinAI, and the critical discussions around AI's role in biology and creative industries, we encapsulate the rapid innovation within AI and the ongoing dialogue on ethical frameworks and regulatory needs. Through these highlights, we aim to provide a concise overview of AI's transformative journey and its societal impacts.
                </p>

                <!-- Cover Story -->
                <h2>Cover Story</h2>
                <hr style="margin-bottom: 1em;" />

                {% for post_entry in page.selected_posts %}
                    {% assign post = site.posts | where: 'path', post_entry.path | first %}
                    {% assign first_img_url = "" %}
                    {% if post.content contains "<img" %}
                        {% assign img_tags = post.content | split: '<img ' %}
                        {% assign first_img_tag = img_tags[1] | split: '>' | first %}
                        {% assign first_img_url = first_img_tag | split: 'src="' | last | split: '"' | first %}
                    {% endif %}
                    {% assign words = post.content | strip_html | number_of_words %}
                    {% assign duration = words | divided_by: 200 | plus: 1 %}

                    {% if forloop.first %}
                        <div class="row justify-content-start mb-1">
                            <!-- Image cell -->
                            <div class="col-12 col-md-7">
                                <div style="width: 100%; overflow: hidden;">
                                <img src="{{ first_img_url }}" style="width: 100%; height: auto;"/>
                                </div>
                            </div>
                            <!-- Meta information and excerpt cell -->
                            <div class="col-12 col-md-5" style="vertical-align: top;">
                                <h2 class="service-title">
                                    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
                                </h2>
                                <div class="service-content">
                                    <div style="font-size: 0.8em; color: gray; margin-bottom: 1em;">
                                        Published at {{ post.date }}, {{words}} words, {{duration}} min read
                                    </div>
                                    <p>{{ post.excerpt | markdownify | strip_html | truncate: 800 }}</p>
                                </div>
                            </div>
                        </div>
                        {% break %} <!-- Ends the loop after the first item for the cover story -->
                    {% endif %}
                {% endfor %}


                <!-- Story Collection -->
                <h2>Featured Articles</h2>

                {% for post_entry in page.selected_posts offset:1 %}
                    {% assign post = site.posts | where: 'path', post_entry.path | first %}
                    {% assign first_img_url = "" %}
                    {% if post.content contains "<img" %}
                        {% assign img_tags = post.content | split: '<img ' %}
                        {% assign first_img_tag = img_tags[1] | split: '>' | first %}
                        {% assign first_img_url = first_img_tag | split: 'src="' | last | split: '"' | first %}
                    {% endif %}
                    {% assign words = post.content | strip_html | number_of_words %}
                    {% assign duration = words | divided_by: 200 | plus: 1 %}

                    <div class="row justify-content-start mb-1">
                        <hr style="margin-bottom: 1em;" />
                        <!-- Image cell -->
                        <div class="col-12 col-md-3">
                            <div style="width: 100%; overflow: hidden;">
                            <img src="{{ first_img_url }}" style="width: 100%; height: auto;"/>
                            </div>
                        </div>
                    
                        <!-- Meta information and excerpt cell -->
                        <div class="col-12 col-md-9" style="vertical-align: top;">
                            <div class="service-content">
                            <h2 class="service-title">
                                <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
                            </h2>
                            <div style="font-size: 0.8em; color: gray; margin-bottom: 0.5em;">
                                Date: {{ post.date }}, Length: {{words}} words, Duration: {{duration}} min read, Article: #{{ site.posts | size | minus: forloop.index | plus: 1 }}
                            </div>
                            <p>{{ post.excerpt | markdownify | strip_html | truncate: 300 }}</p>
                            </div>
                        </div>
                    </div>
                {% endfor %}

            </div>
        </div>
    </div>
</div>