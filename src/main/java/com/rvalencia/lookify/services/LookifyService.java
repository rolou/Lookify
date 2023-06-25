package com.rvalencia.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.rvalencia.lookify.models.Song;
import com.rvalencia.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	
	private final LookifyRepository lookifyRepository;
	
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}
	
	public List<Song> findAll() {
		return lookifyRepository.findAll();
	}
	
	public void create(Song song){
		lookifyRepository.save(song);
	}
	
	public List<Song> topTen(){
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
	public void deleteSong(Long id) {
		lookifyRepository.deleteById(id);
	}
	
	public Song findById(Long id) {
		Optional<Song> optionalSong = lookifyRepository.findById(id);
		if (optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	public List<Song> findAllByArtist(String artist) {
		List<Song> songs = lookifyRepository.findAllByArtist(artist);
		if (songs.isEmpty()) {
			return null;
		} else {
			return songs;
		}
	}
}

