package com.posts.posts.Services;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.posts.posts.Entities.Post;
import com.posts.posts.Repositories.PostRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class PostService {
    private final PostRepository postRepository;

    public PostService (PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> getPostList () {
        return postRepository.findAll();
    }

    public Post getPostByUuid (UUID uuid) {
        try {            
            return postRepository.getReferenceById(uuid);
        } catch (Exception e) {
            throw new EntityNotFoundException("Post not found with id " + uuid);
        }
    }

    public Post createPost(Post post) {
        return postRepository.save(post);
    }

    public Post updatePost(UUID id, Post updatedPost) {
        Post existingPost = getPostByUuid(id);
        existingPost.setTitle(updatedPost.getTitle());
        existingPost.setContent(updatedPost.getContent());
        return postRepository.save(existingPost);
    }

    public void deletePost(UUID id) {
        postRepository.deleteById(id);
    }
}
