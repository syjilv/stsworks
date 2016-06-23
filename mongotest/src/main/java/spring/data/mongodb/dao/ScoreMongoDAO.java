package spring.data.mongodb.dao;

import java.util.List;

import spring.data.mongodb.dto.ScoreDTO;

public interface ScoreMongoDAO {
	public void insertDocument(ScoreDTO doc);
	public void insertAllDocument(List<ScoreDTO> docs);
	public List<ScoreDTO> findCriteria(String key,String value);
	public ScoreDTO findById(String key,String value);
	public void update(ScoreDTO doc);
	public void delete(String key, String value);
}
