package com.posts.posts.Models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
public class Post {
    @Getter
    @Setter
    String title;
    @Getter
    @Setter
    String content;
}
