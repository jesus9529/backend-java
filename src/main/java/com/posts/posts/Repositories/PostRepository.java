package com.posts.posts.Repositories;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.posts.posts.Entities.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, UUID>{
   
}
