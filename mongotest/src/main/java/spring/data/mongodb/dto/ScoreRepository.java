package spring.data.mongodb.dto;

import org.springframework.data.repository.PagingAndSortingRepository;

// �ƹ� �͵� �������� ���� ���� - CRUD�� ������ 

public interface ScoreRepository extends PagingAndSortingRepository<Score, String> {

}
