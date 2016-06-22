package spring.data.mongodb.dto;

import org.springframework.data.repository.PagingAndSortingRepository;

// 아무 것도 정의하지 않을 것임 - CRUD를 접근할 

public interface ScoreRepository extends PagingAndSortingRepository<Score, String> {

}
