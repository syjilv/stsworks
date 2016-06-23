package spring.data.mongodb.service;

import java.util.List;

import spring.data.mongodb.dto.ScoreDTO;

public interface ScoreMongoService {
	public ScoreDTO findById(String key,String value);
	public void insertDocument(ScoreDTO doc);
	public void insertAllDocument(List<ScoreDTO> docs);
	public List<ScoreDTO> findCriteria(String key,String value);
	public void update(ScoreDTO doc);
	public void delete(String key, String value);
}
