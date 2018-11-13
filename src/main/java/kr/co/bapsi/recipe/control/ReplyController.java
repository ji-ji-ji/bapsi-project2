package kr.co.bapsi.recipe.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bapsi.recipe.reply.service.ReplyService;
import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.PagingMaker;
import kr.co.bapsi.recipe.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {

   @Inject
   private ReplyService rsvc;

   // ResponseEntity - Http상태코드 return
   // @RequestBody - 전송된 데이터를 JSON객체로 변환시켜주는 어노테이션 -> Model과 유사함, 단지 JSON을 사용하는것
   // 댓글 등록- POST 수정-PUT,PATCH 삭제-DELETE
// 댓글 등록 
   @RequestMapping(value = "", method = RequestMethod.POST)
   public ResponseEntity<String> input(@RequestBody ReplyVO rvo) {

      ResponseEntity<String> resEntity = null;

      try {
         rsvc.inputReply(rvo);
         resEntity = new ResponseEntity<String>("Success", HttpStatus.OK); // 성공하면 Success를 보낸다. 200번(성공을의미하는값)
      } catch (Exception e) {
         e.printStackTrace();
         resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // 실패했을 경우- 400번
      }

      return resEntity;

   }

// 댓글 리스트
   // @PathVariable - 경로에서 들어오는 값을 지정
   @RequestMapping(value = "/selectAll/{recipeNo}", method = RequestMethod.GET)
   public ResponseEntity<List<ReplyVO>> list(@PathVariable("recipeNo") int recipeNo) {

      ResponseEntity<List<ReplyVO>> resEntity = null;

      try {
         resEntity = new ResponseEntity<>(rsvc.replyList(recipeNo), HttpStatus.OK);

      } catch (Exception e) {
         e.printStackTrace();
         resEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      return resEntity;
   }

// 댓글 수정
   // @RequestBody Json인자를 rvo형태로 변환하는 어노테이션
   @RequestMapping(value = "/{no}", method = { RequestMethod.PUT, RequestMethod.PATCH })
   public ResponseEntity<String> modify(@PathVariable("no") int no, @RequestBody ReplyVO rvo) {

      ResponseEntity<String> resEntity = null;

      try {
         rvo.setNo(no);
         rsvc.modifyReply(rvo);

         resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);

      } catch (Exception e) {
         e.printStackTrace();
         resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // 실패했을 경우- 400번
      }

      return resEntity;
   }

// 댓글 삭제
   @RequestMapping(value = "/{no}", method = RequestMethod.DELETE)
   public ResponseEntity<String> reDel(@PathVariable("no") int no) {

      ResponseEntity<String> resEntity = null;

      try {
         rsvc.deReply(no);
         resEntity = new ResponseEntity<String>("Success", HttpStatus.OK); // 성공하면 Success를 보낸다. 200번(성공을의미하는값)
      } catch (Exception e) {
         e.printStackTrace();
         resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // 실패했을 경우- 400번
      }

      return resEntity;

   }

// 댓글 페이징
   @RequestMapping(value = "/{recipeNo}/{page}", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> reListPage(@PathVariable("recipeNo") int recipeNo,
                                            @PathVariable("page") int page
                                            , Model model) {

      ResponseEntity<Map<String, Object>> resEntity = null;

      try {
         PageCriteria pCri = new PageCriteria();
         pCri.setPage(page);
         pCri.setNumPerPage(8);

         PagingMaker pagingMaker = new PagingMaker();
         pagingMaker.setCri(pCri);

         Map<String, Object> reMap = new HashMap<String, Object>();
         List<ReplyVO> reList = rsvc.replyListPage(recipeNo, pCri);

         reMap.put("reList", reList);
         //System.out.println("@@@@@@@@@@@ : " +  reList.toString());
       
         int reCount = rsvc.reCount(recipeNo);
         pagingMaker.setTotalData(reCount);
         
         reMap.put("pagingMaker", pagingMaker);
         reMap.put("ENDPAGE", pagingMaker.getEndPage());
         
         resEntity = new ResponseEntity<Map<String,Object>>(reMap, HttpStatus.OK);
         
      } catch (Exception e) {
         e.printStackTrace();
         resEntity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);   
      }
      return resEntity;

   }

}








