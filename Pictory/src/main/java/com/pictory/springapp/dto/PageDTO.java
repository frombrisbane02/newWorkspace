package com.pictory.springapp.dto;

import lombok.Data;

@Data
public class PageDTO {

   private int pageNum;         // 현재 페이지 번호
   private int rowsPerPage = 10;      // 페이지 당 게시물 수
   
   private int startPage;         // 시작 페이지 번호
   private int endPage;         // 끝 페이지 번호
   
   private int firstPage;         // 첫 번째 페이지 번호
   private int lastPage;         // 마지막 페이지 번호
   
   private int prev;            // 이전 페이지 번호
   private int next;            // 다음 페이지 번호
   private int pageCount = 10;      // 노출 페이지 개수
   private int totalCount;         // 전체 데이터 개수
   
   private int startRowIndex;      // 시작 글 index
   
   private String keyword;         // 검색어
   
   private int start;
   private int end;
   
   public PageDTO() {
	   
   }
   
   public PageDTO(int pageNum, int totalCount, String keyword) {
	      this.pageNum = pageNum;
	      this.totalCount = totalCount;
	      this.keyword = keyword;
	      
	      this.pageNum = pageNum;
	      this.totalCount = totalCount;
	      this.keyword = keyword;
	      
	      this.prev = pageNum - 1;
	      this.next = pageNum + 1;
	      
	      this.startRowIndex = ( pageNum - 1 ) * rowsPerPage;
	      
	      this.firstPage = 1;
	      
	      if( totalCount % rowsPerPage == 0 )
	         this.lastPage = totalCount / rowsPerPage;
	      else
	         this.lastPage = (totalCount / rowsPerPage) + 1;
	      
	      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
	      
	      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
	      
	      if( this.endPage > this.lastPage )
	         this.endPage = this.lastPage;
	      
	      // START : 1, 11, 21, 
	      this.start = (this.pageNum - 1) * this.rowsPerPage + 1;
	      this.end = this.start + rowsPerPage - 1;
	      
	      
   }
   
   
   public PageDTO(int pageNum, int rowsPerPage) {
      this.pageNum = pageNum;
      this.rowsPerPage = rowsPerPage;
      
      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
   }
   
   public PageDTO(int pageNum, int rowsPerPage, int totalCount) {
      this.pageNum = pageNum;
      this.rowsPerPage = rowsPerPage;
      this.totalCount = totalCount;
      
      this.prev = pageNum - 1;
      this.next = pageNum + 1;
      
      this.startRowIndex = ( pageNum - 1 ) * rowsPerPage;
      
      this.firstPage = 1;
      
      if( totalCount % rowsPerPage == 0 )
         this.lastPage = totalCount / rowsPerPage;
      else
         this.lastPage = (totalCount / rowsPerPage) + 1;
      
      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
      
      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
      
      if( this.endPage > this.lastPage )
         this.endPage = this.lastPage;
      
   }
   
   public PageDTO(int pageNum, int rowsPerPage, int totalCount, String keyword) {
      this.pageNum = pageNum;
      this.rowsPerPage = rowsPerPage;
      this.totalCount = totalCount;
      this.keyword = keyword;
      
      this.prev = pageNum - 1;
      this.next = pageNum + 1;
      
      
      this.firstPage = 1;
      
      if( totalCount % rowsPerPage == 0 )
         this.lastPage = totalCount / rowsPerPage;
      else
         this.lastPage = (totalCount / rowsPerPage) + 1;
      
      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
      
      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
      
      if( this.endPage > this.lastPage )
         this.endPage = this.lastPage;
      
      this.startRowIndex = ( pageNum - 1 ) * rowsPerPage;
   }
   
   public PageDTO(int pageNum, int rowsPerPage, int pageCount, int totalCount) {
      this.pageNum = pageNum;
      this.rowsPerPage = rowsPerPage;
      this.pageCount = pageCount;
      this.totalCount = totalCount;
      
      this.prev = pageNum - 1;
      this.next = pageNum + 1;
      
      this.startRowIndex = ( pageNum - 1 ) * rowsPerPage;
      
      this.firstPage = 1;
      
      if( totalCount % rowsPerPage == 0 )
         this.lastPage = totalCount / rowsPerPage;
      else
         this.lastPage = (totalCount / rowsPerPage) + 1;
      
      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
      
      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
      
      if( this.endPage > this.lastPage )
         this.endPage = this.lastPage;
      
   }
   
   
   public PageDTO(int pageNum, int rowsPerPage, int pageCount, int totalCount, String keyword) {
      this.pageNum = pageNum;
      this.rowsPerPage = rowsPerPage;
      this.pageCount = pageCount;
      this.totalCount = totalCount;
      this.keyword = keyword;
      
      this.prev = pageNum - 1;
      this.next = pageNum + 1;
      
      this.startRowIndex = ( pageNum - 1 ) * rowsPerPage;
      
      this.firstPage = 1;
      
      if( totalCount % rowsPerPage == 0 )
         this.lastPage = totalCount / rowsPerPage;
      else
         this.lastPage = (totalCount / rowsPerPage) + 1;
      
      this.startPage =  ( (pageNum-1) / pageCount ) * pageCount + 1;
      
      this.endPage = ( ((pageNum-1) / pageCount ) + 1 )  * pageCount;
      
      if( this.endPage > this.lastPage )
         this.endPage = this.lastPage;
      
   }
	
}
