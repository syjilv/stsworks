package spring.data.mongodb.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import spring.data.mongodb.dto.ScoreDTO;

@Repository
public class ScoreMongoDAOImple implements ScoreMongoDAO {
	@Autowired
	MongoTemplate mongoTemplate;
	@Override
	public void insertDocument(ScoreDTO doc) {
		mongoTemplate.insert(doc);		
	}

	@Override
	public void insertAllDocument(List<ScoreDTO> docs) {
		mongoTemplate.insertAll(docs);
	}

	@Override
	public ScoreDTO findById(String key, String value) {
		// MongoD에 조건을 모델링한 객체 어떤 필드에 대해서 어떤 값으로 조건을 적용할 지 정의
		Criteria criteria = new Criteria(key);
		criteria.is(value);
		Query query = new Query(criteria);
		ScoreDTO data = mongoTemplate.findOne(query, ScoreDTO.class, "score");
		return data;
	
	}

	@Override
	public List<ScoreDTO> findCriteria(String field, String value) {
		Criteria criteria = new Criteria(field);
		criteria.gt(Integer.parseInt(value));
		Query query = new Query(criteria);
		List<ScoreDTO> datalist = mongoTemplate.find(query, ScoreDTO.class, "score");
		return datalist;
	}

	@Override
	public void update(ScoreDTO doc) {
		Criteria criteria = new Criteria("id");
		criteria.is(doc.getId());
		Query query = new Query(criteria);
		
		Update update = new Update();
		update.set("name", doc.getName());
		update.set("dept", doc.getDept());
		update.set("addr", doc.getAddr());
		update.set("java", doc.getJava());
		update.set("servlet", doc.getServlet());
		update.set("spring", doc.getSpring());
		update.set("bonus", doc.getBonus());
		
		mongoTemplate.updateMulti(query, update, "score");
	}

	@Override
	public void delete(String key, String value) {
		Criteria criteria = new Criteria(key);
		criteria.is(value);
		Query query = new Query(criteria);
		
		mongoTemplate.remove(query, "score");
	}
}
