package com.rvalencia.lookify.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rvalencia.lookify.models.Song;
import com.rvalencia.lookify.services.LookifyService;

import jakarta.validation.Valid;

@Controller
public class LookifyController {
	private final LookifyService lookifyService;
	
	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> list = lookifyService.findAll();
		model.addAttribute("list", list);
		return "dashboard.jsp";
	}
	
	@GetMapping("/songs/new")
	public String formSong(@ModelAttribute("Song") Song song) {
		return "new.jsp";
	}
	
	@PostMapping("/dashboard")
	public String nuevaSong(
			@Valid 
			@ModelAttribute("Song") Song song, 
			BindingResult result
			) {
		if(result.hasErrors()) {
				return "new.jsp";
		}else {
			lookifyService.create(song);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/search/topTen")
	public String topTen(Model viewModel) {
		List<Song> topTen = lookifyService.topTen();
		viewModel.addAttribute("topTen", topTen);
		return "topTen.jsp";
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		lookifyService.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/songs/{id}")
	public String showSongDetail(
			@PathVariable("id") Long id,
			Model model
			) {
		Song song = lookifyService.findById(id);
		if (song != null) {
			model.addAttribute("song", song);
			return "detail.jsp";
		} else {
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/search")
	public String songByArtist(
			@RequestParam(value="q") String searchQuery,
			Model model
			) {
		List<Song> list = lookifyService.findAllByArtist(searchQuery);
		model.addAttribute("q", searchQuery);
		model.addAttribute("list", list);
		return "artistSearch.jsp";
	}
	
	
}

