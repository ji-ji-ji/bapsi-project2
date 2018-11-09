package kr.co.bapsi.upload.control;

import java.io.File;

import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.upload.vo.UploadVO;

@Controller
public class UploadController {

   @Inject
   private SqlSession sqlSession;
   
   @Resource(name = "uploadPath")
   String uploadPath;
   
   // 회원 마이프로필 업로드
   @RequestMapping(value = "/upload/uploadFile" , method = RequestMethod.POST)
   public ModelAndView uploadProfile(MultipartFile file, ModelAndView mav, HttpSession session) throws Exception{
      
         UploadVO upload = new UploadVO();
         MemberVO authUser = (MemberVO)session.getAttribute("userVO");
        		 
         System.out.println("파일 이름 : " + file.getOriginalFilename());
         System.out.println("퍼일 크기 : " + file.getSize());
         System.out.println("컨텐트 타입 : " + file.getContentType());
         
          // 파일의 원본이름 저장
           String savedName = file.getOriginalFilename();

         System.out.println("파일 이름 : " + file.getOriginalFilename());
         System.out.println("퍼일 크기 : " + file.getSize());
         System.out.println("컨텐트 타입 : " + file.getContentType());
         System.out.println("과연 뭘까 : " + file);
           
           // 랜덤생성+파일이름 저장
           // 파일명 랜덤생성 메서드호출
           savedName = uploadFile(savedName, file.getBytes());
           
           upload.setUserNo(authUser.getNo());
           upload.setFile_oriname(file.getOriginalFilename());
           upload.setFile_fakename(savedName);
           
           System.out.println("upload no : " + authUser.getNo());
           System.out.println("upload fakename : " + savedName);
           
           sqlSession.insert("uploadProfile", upload);
           
           mav.setViewName("jsp/member/uploadCome");
           mav.addObject("savedName", savedName);

           return mav; // (결과화면)로 포워딩
       }

   
   // 파일명 랜덤생성 메서드
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String savedName = uuid.toString()+"_"+originalName;
        File target = new File(uploadPath, savedName);
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(fileData, target);
        
        return savedName;
    }
   
    // 회원 마이프로필 삭제
    @RequestMapping(value="/fileDelete")
    public String fileDelete(UploadVO upload, HttpSession session) {
       
    	MemberVO authUser = (MemberVO)session.getAttribute("userVO"); 

       upload = sqlSession.selectOne("profile",authUser.getNo());
       
       System.out.println("파일 fakename : " + upload.getFile_fakename());
       
       String path = "";
       
       String profile = "/" + upload.getFile_fakename();
       
       path = uploadPath + profile;
       
       System.out.println("삭제할 파일 경로 : " + path);
       
       File file = new File(path);

          if(file.exists() == true){

             file.delete();
          }
          
       sqlSession.delete("deleteProfile", authUser.getNo());
       
       session.removeAttribute(profile);
       /*session.invalidate();*/

       return "jsp/member/fileOut";

      }
    
    // 회원의 프로필 삭제
    @RequestMapping(value="/{no}/memberFileDelete")
    public String memberFileDelete(@PathVariable("no")int no, UploadVO upload, HttpSession session) {
    	
    	upload = sqlSession.selectOne("profile",no);
        
        System.out.println("파일 fakename : " + upload.getFile_fakename());
        
        String path = "";
        
        String profile = "/" + upload.getFile_fakename();
        
        path = uploadPath + profile;
        
        System.out.println("삭제할 파일 경로 : " + path);
        
        File file = new File(path);

           if(file.exists() == true){

              file.delete();
           }
           
        sqlSession.delete("memberDeleteProfile", no);

    	
    	return "jsp/admin/memberFileOut";
    }
}