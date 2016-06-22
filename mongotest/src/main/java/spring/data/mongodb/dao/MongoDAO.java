package spring.data.mongodb.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.data.mongodb.dto.Score;
import spring.data.mongodb.dto.ScoreRepository;

@Repository
public class MongoDAO {
	@Autowired
	ScoreRepository repository;
	public List<Score> findAll() {
		List<Score> mongolist = (List<Score>) repository.findAll();
		System.out.println(mongolist.size());
		return mongolist;
	}
}
