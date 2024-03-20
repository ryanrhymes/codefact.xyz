---
layout: default
toc: true
title: "Technology Weekly: March 10-16, 2024"
date: 2024-03-19 23:29:00 +0200
bodyClass: "page-basic"

selected_posts:
  - path: _posts/2024-03-16-ai-diversity-regulation.md
  - path: _posts/2024-03-17-can-llm-understand-text.md
  - path: _posts/2024-03-16-enhanced-lll-algorithm.md
---

<div class="container pb-6 pt-6 pt-md-10 pb-md-10">
    <div class="row justify-content-start">
        <div class="col-12">
            <div class="service service-single">
                <h2 class="title" style="margin-bottom:1em">{{page.title}}</h2>

                <!-- Cover Story -->

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
                                <div style="width: 100%; height: 400px; overflow: hidden;">
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
                            <div style="width: 100%; height: 140px; overflow: hidden;">
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