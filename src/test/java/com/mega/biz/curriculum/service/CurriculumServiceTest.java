package com.mega.biz.curriculum.service;

import com.mega.biz.curriculum.model.dto.CurriculumWithDetailDTO;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CurriculumServiceTest {

    CurriculumService service = new CurriculumService();

    @Test
    void getAllCurriculum() {
        List<CurriculumWithDetailDTO> allCurriculum = service.getAllCurriculumWithDetail();
        String test = "test";
    }

}