package jcep.admin.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
        // UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName = uuid.toString() + "_" + originalName;
        // 업로드할 디렉토리(날짜별 폴더) 생성 
        String savedPath = calcPath(uploadPath);
        //String savedPath = uploadPath;
        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
        // File target = new File(uploadPath + savedPath, savedName);
        File target = new File(FilenameUtils.normalize(uploadPath + savedPath), FilenameUtils.getName(savedName));	// findBugs Patch(Potential Path Traversal)
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        // 썸네일을 생성하기 위한 파일의 확장자 검사
        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        // 이미지 파일은 썸네일 사용
        if (MediaUtils.getMediaType(formatName) != null) {
            // 썸네일 생성
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        // 나머지는 아이콘
        } else {
            // 아이콘 생성
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        }
        return uploadedFileName;
    }
		
	public static String uploadFile_1(String uploadPath, String originalName, byte[] fileData,String userId,int fileNum) throws Exception {
        if(fileData.length > 0){
	        String savedName =userId.substring(9,14)+"_"+fileNum+originalName.substring(originalName.lastIndexOf("."));
	        //파일이 존재한다면 삭제
	        fileDelete(savedName);
	        // 업로드할 디렉토리(아이디 폴더) 생성 
	        String savedPath = userIdPath(uploadPath,userId);
	 
	        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
	        // File target = new File(uploadPath + savedPath, savedName);
	        File target = new File(FilenameUtils.normalize(uploadPath + savedPath), FilenameUtils.getName(savedName));	// findBugs Patch(Potential Path Traversal)
	        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
	        FileCopyUtils.copy(fileData, target);
	        // 썸네일을 생성하기 위한 파일의 확장자 검사
	        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
	        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
	        String uploadFilePath = (userId.substring(0,3)+File.separator+userId.substring(3,6)+File.separator+userId.substring(6,9));
	        // 이미지 파일은 썸네일 사용
	        if (MediaUtils.getMediaType(formatName) != null) {
	            // 썸네일 생성
	            makeThumbnail(uploadPath, savedPath, savedName);
	        // 나머지는 아이콘
	        } else {
	            // 아이콘 생성
	             makeIcon(uploadPath, savedPath, savedName);
	        }
	        return uploadFilePath;
        }
        return null;
    }
	
	public static String imageFileUpload(String uploadPath, String originalName, byte[] fileData) throws Exception {
        // UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName = originalName;
 	//파일이 존재한다면 삭제
        fileDelete(savedName);
        // 업로드할 디렉토리(날짜별 폴더) 생성 
        String savedPath = calcPath(uploadPath);
        //String savedPath = uploadPath;
        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
        // File target = new File(uploadPath + savedPath, savedName);
        File target = new File(FilenameUtils.normalize(uploadPath + savedPath), FilenameUtils.getName(savedName));	// findBugs Patch(Potential Path Traversal)
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        // 썸네일을 생성하기 위한 파일의 확장자 검사
        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        // 이미지 파일은 썸네일 사용
 /*       if (MediaUtils.getMediaType(formatName) != null) {
            // 썸네일 생성
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        // 나머지는 아이콘
        } else {*/
            // 아이콘 생성
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        //}
        return uploadedFileName;
    }
	
	public static String imageFileUpload2(String uploadPath, String originalName, byte[] fileData, Integer fileNum) throws Exception {
        // UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName = uuid.toString() + "_" + originalName;
 	//파일이 존재한다면 삭제
        fileDelete(savedName);
        // 업로드할 디렉토리(날짜별 폴더) 생성 
        String savedPath = calcPath(uploadPath);
        //String savedPath = uploadPath;
        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
        // File target = new File(uploadPath + savedPath, savedName);
        File target = new File(FilenameUtils.normalize(uploadPath + savedPath), FilenameUtils.getName(savedName));	// findBugs Patch(Potential Path Traversal)
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        // 썸네일을 생성하기 위한 파일의 확장자 검사
        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        // 이미지 파일은 썸네일 사용
 /*       if (MediaUtils.getMediaType(formatName) != null) {
            // 썸네일 생성
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        // 나머지는 아이콘
        } else {*/
            // 아이콘 생성
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        //}
        return uploadedFileName;
    }	
	
	//파일 삭제
	public static void fileDelete(String directory){
		//File file = new File(directory);
		File file = new File(FilenameUtils.normalize(directory));	// findBugs Patch(Potential Path Traversal)
		if(file.exists()){
			file.delete();
		}
	}
	
	//이미지 경로에서 다운후 로컬 저장
	public static Integer imageLinkDown(String imageUrl,String uploadPath ,String id,String fileName,HttpServletRequest request )throws Exception{
		Integer returnCode=0;
		
		try {
				/*최초버전*/
				URL  url = new URL(imageUrl);  //이미지 경로
				BufferedImage img = ImageIO.read(url.openStream()); //이미지 읽어드리기

				String imageUploadPath = userIdPath(uploadPath,id);//아이디로 경로에 폴더
				String formatName = imageUrl.substring(imageUrl.lastIndexOf(".")+1); //확장자
				String savedName =fileName+"."+formatName; //파일명
				System.out.println("img.getHeight()"+img.getHeight());
				System.out.println("img.getWidth()"+img.getWidth());
				
				if(img.getHeight() > 500 || img.getWidth() > 500){ //이미지 사이즈 초과
					returnCode = 1; 
				}
				if (MediaUtils.getMediaType(formatName) == null) { //jpg,gif,jpeg 체크
					 returnCode =2;
				}		
				if(!imageUrl.toLowerCase().substring(0,7).equals("http://")){
					returnCode=3; //잘못된 이미지 경로
				}
				if(returnCode ==0){
					 String  deleFile =uploadPath+imageUploadPath+File.separator+savedName.substring(0,savedName.lastIndexOf("."));
				     //파일이 존재한다면 삭제
				     fileDelete(deleFile);
		
					//File file =  new File(uploadPath+imageUploadPath+File.separator+savedName); //해당경로 폴더생성
					File file =  new File(FilenameUtils.normalize(uploadPath+imageUploadPath), FilenameUtils.getName(savedName)); // findBugs Patch(Potential Path Traversal)
					ImageIO.write(img, formatName, file); //이미지 생성
					//썸네일 생성
					makeThumbnail(uploadPath, imageUploadPath,savedName);
				}
				//conn.disconnect(); //접속 해제
		} catch (IOException e) {
			returnCode=3; //잘못된 이미지 경로
		}
		
		return returnCode;
	}
	
	 //아이디명 디렉토리 생성
    private static String userIdPath(String uploadPath,String userId) {
    	// File.separator : 디렉토리 구분자(\\)  //P7300901823178
        String userPath1=File.separator +userId.substring(0,3);//P730
        String userPath2=File.separator +userId.substring(3,6);//0901
        String userPath3=File.separator +userId.substring(6,9);//823
        String userPath=File.separator +userPath1+userPath2+userPath3;
        
        makeDir_1(uploadPath, userPath);
        return userPath;
    }
    
    // 날짜별 디렉토리 추출
    private static String calcPath(String uploadPath) {
        Calendar cal = Calendar.getInstance();
        // File.separator : 디렉토리 구분자(\\)
        // 연도, ex) \\2017 
        String yearPath = "";//File.separator + cal.get(Calendar.YEAR);
        System.out.println(yearPath);
        // 월, ex) \\2017\\03
        String monthPath = "";//yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        System.out.println(monthPath);
        // 날짜, ex) \\2017\\03\\01
        String datePath = "";//monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        System.out.println(datePath);
        // 디렉토리 생성 메서드 호출
        makeDir(uploadPath, yearPath, monthPath, datePath);
        return datePath;
    }
    
    /*상품 이미지 디렉토리 생성*/
    private static void makeDir_1(String uploadPath, String  paths) {
    	// File desti = new File(uploadPath+paths);
    	File desti = new File(FilenameUtils.normalize(uploadPath+paths));  // findBugs Patch(Potential Path Traversal)
    	if(!desti.exists()){//파일이 없을 때
    		desti.mkdirs();
    	}
    }   
    
    // 디렉토리 생성
    private static void makeDir(String uploadPath, String... paths) {
        // 디렉토리가 존재하면
        if (new File(paths[paths.length - 1]).exists()){
            return;
        }
        // 디렉토리가 존재하지 않으면
        for (String path : paths) {
 
            // File dirPath = new File(uploadPath + path);
            File dirPath = new File(FilenameUtils.normalize(uploadPath + path));  // findBugs Patch(Potential Path Traversal)
            // 디렉토리가 존재하지 않으면
            if (!dirPath.exists()) {
                dirPath.mkdir(); //디렉토리 생성
            }
        }
    }    

    // 썸네일 생성
    private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
        // 이미지를 읽기 위한 버퍼
        // BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        BufferedImage sourceImg = ImageIO.read(new File(FilenameUtils.normalize(uploadPath + path), FilenameUtils.getName(fileName)));  // findBugs Patch(Potential Path Traversal)
        // 100픽셀 단위의 썸네일 생성
        //BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 72);
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, 72, 72);
        // 썸네일의 이름을 생성(원본파일명에 '72_'를 붙임)
        String thumbnailName = uploadPath + path + File.separator + "72_" + fileName;
        // File newFile = new File(thumbnailName);
        File newFile = new File(FilenameUtils.normalize(thumbnailName));  // findBugs Patch(Potential Path Traversal)
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 썸네일 생성
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        // 썸네일의 이름을 리턴함
        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    // 아이콘 생성
    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
        // 아이콘의 이름
        String iconName = uploadPath + path + File.separator + fileName;
        // 아이콘 이름을 리턴
        // File.separatorChar : 디렉토리 구분자
        // 윈도우 \ , 유닉스(리눅스) /         
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
    
    
}

