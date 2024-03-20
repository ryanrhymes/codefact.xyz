---
title: Newsletter
layout: default
description: Newsletter
permalink: "/newsletter/"
bodyClass: "page-basic"
---

<div class="container pb-6 pt-6 pt-md-10 pb-md-10">
    <div class="row justify-content-start">
        <div class="col-12">
            <div class="service service-single">

                {% for post in site.newsletter %}
                    {% assign first_img_url = "" %}
                    {% if post.content contains "<img" %}
                        {% assign img_tags = post.content | split: '<img ' %}
                        {% assign first_img_tag = img_tags[1] | split: '>' | first %}
                        {% assign first_img_url = first_img_tag | split: 'src="' | last | split: '"' | first %}
                    {% endif %}
                    {% assign words = post.content | strip_html | number_of_words %}
                    {% assign duration = words | divided_by: 200 | plus: 1 %}


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
                                        Published on {{ post.date }}, {{words}} words, {{duration}} min read
                                    </div>
                                    <p>{{ post.excerpt | markdownify | strip_html | truncate: 800 }}</p>
                                </div>
                            </div>
                        </div>

                {% endfor %}

            </div>
        </div>
    </div>
</div>