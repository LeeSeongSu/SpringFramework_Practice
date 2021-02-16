### Spring Framework Study

------

- #### 2021-01-21

1. ###  **기본 설치**

   - ##### JDK, STS, Tomcat 설정 

     - JDK1.8 이상 사용

     - 환경 변수 설정도 같이 진행할 것 - 문제가 발생하면

     - 컴이름 한글 절대 금지 (선조건)

   - ##### Lombok 관련 설정 [설치](https://projectlombok.org/download)

     - 컴파일시에 getter/setter,생성자,toString() 등을 자동으로 생성해주기 때문에 편리함
     - 코드 컴파일 / IDE 지원
     - 다운로드 후에 Eclipse에 추가 설치 필요

   ​    

2. ### **의존성 주입**

   #### **의존성 주입이란?**

   **코드의 내부에서 객체간의 연결을 이루지 않고, 외부에서 설정을 통해서 객체간을 연결하는 패턴**

   **컴파일시가 아닌 실행시에 의존 관계가 완성되는 방식**

   **스프링의 경우 의존성 주입을 쉽게 적용할 수 있는 프레임워크**

   

   - ##### 의존성 주입 설정시 확인하는 내용들 


   ```java
   @Component
   @ToString
   
   public class SampleHotel {
   
   	private Chef chef;
   
   	public SampleHotel(Chef chef) {
   		super();
   		this.chef = chef;
   	}
   
   }
   ```



   ```java
   @Component
   @ToString
   @RequiredArgsConstructor
   public class SampleHotel {
   
   	private final Chef chef;
   
   }
   
   ```

   위에 첫번째와 두번째 코드는 둘다 같은 의미이나, 밑에 코드를 더 자주 사용하는 추세

   

3. ### **스프링과 Oracle Database 연동**

   - ##### 오라클 데이터베이스 설치와 계정 생성, SQL Developer 연동 

     - Oracle 11g Express Edition [설치](https://www.oracle.com/database/technologies/xe-downloads.html)
     - 오라클 포트번호 변경 - > exec dbms_xdb.sethttpport(8000); //8000포트를 쓴다고 한다면..

   - ##### JDBC 드라이버 설정과 JDBC연결 확인 

     - 'maven oracle' 구글링해서 Ojdbc 설치(사용자가 많은 것 설치하자..)  후에 dependency 추가

   - ##### HikariCP설정 및 테스트 

     - ###### DataSource 설정

       - DB와 Connection을 맺고 끊는 작업은 리소스의 소모가 많은 작업

       - Pooling이라는 기법을 통해서 객체를 미리 생성하고 빌려 쓰는 방식으로 이용해서 연결 시간을 단축

       - Commons DBCP나 HikariCp 등을 활용 ('maven hikaricp' 구글링 후 셋팅 ) 후에 dependency 추가

         

4. ### **MyBatis와 스프링 연동**

   #### MyBatis란?

   - ##### SQL Mapping 프레임워크

     - SQL과 Object간의 관계를 매핑해주는 역할
     - JDBC코드에 비해 처리하는 부분이 간결해지고, close처리등이 지원

   - ##### Spring에서의 사용

     - 스프링은 MyBatis와의 연결을 위한 mybatis-spring 라이브러리를 이용해서 연동 처리

   - ##### mybatis-spring의 설정

     - 기본적으로 dataSource의 설정이 필요
     - pom.xml에 라이브러리 추가('mybatis maven', 'mybatis Spring' 구글링 후 셋팅) 후에 dependency 추가

   - ##### SqlSessionFactory의 설정

     - root-context.xml에 MyBatis설정
     - MyBatis의 핵심 객체는 SqlSessionFactory타입의 객체
     - SqlSessionFactoryBean은 내부적으로 MyBatis의 SqlSessionFactory를 생성

   ------

   

   - ##### XML 매퍼파일

     

   - ##### Log4jdbc-log4j2 설정

     - MyBatis는 내부적으로 PreparedStatement를 이용하기 때문에 좀 더 쉽게 SQL의 로그를 보기 위한 설정 - DB버전 조심('log4jdbc-log4j2 maven' 구글링 후 셋팅) 후에 dependency 추가

### 설정 할 시 주의할 점

- ##### 라이브러리 추가

- ##### 설정

  - DataSource 설정 변경
  - 프로퍼티 파일을 반드시 추가

- ##### 설정 전에 동작하는지 확인

  - DB나 JDBC드라이버의 지원이 안됨..

------


- #### 2021-02-02

1. ###  Controller

   - HttpServeletRequest, HttpServletResponse를 거의 사용할 필요 없이 필요한 기능 구현
   - 다양한 타입의 파라미터 처리, 다양한 타입의 리턴 타입 사용 가능
   - GET방식, POST 방식 등 전송 방식에 대한 처리를 어노테이션으로 처리가능
   - 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능

2. ###  @ModelAttribute

   - 컨트롤러에서 메서드의 파라미터는 기본자료형을 제외한 객체형 타입은 다시 화면으로 전달
   - @ModelAttribute는 명시적으로 화면에 전달되도록 지정

3. ###  RedirectAttribute

   - 화면에 한번만 전달되는 파라미터를 처리하는 용도
   - 내부적으로 HttpSession객체에 담아서 한번만 사용되고, 폐기

4. ###  Model이라는 데이터전달자

   - Model 객체는 JSP에 컨트롤러에서 생성된 데이터를 담아서 전달하는 역할을 하는 존재
   - 모델2 방식에서 사용하는 request.setAttribute()와 유사한 역할
   - 과거에는 ModelAndView
   - Model에 담는 데이터 -> 파라미터가 아니라.. 다른 곳에서 발생한 데이터를 담기 위한 용기

5. ###  Controller의 리턴타입

   - String : jsp를 이용하는 경우에는 jsp 파일의 경로와 파일이름을 나타내기 위해서 사용
   - void : 호출하는 URL과 동일한 이름의 jsp를 의미
   - VO,DTO 타입 : 주로 JSON 타입의 데이터를 만들어서 반환하는 용도로 사용(추가적인 라이브러리 필요)
   - ResponseEntity 타입 : response할 때 Http 헤더 정보와 내용을 가공하는 용도로 사용(추가적인 라이브러리 필요)
   - Model, ModelAndView : Model로 데이터를 반환하거나 화면까지 같이 지정하는 경우에 사용(최근에는 많이 사용하지 않는다)
   - HttpHeaders : 응답에 내용 없이 Http 헤더 메시지만 전달하는 용도로 사용

------

- #### 2021-02-02

  1.  프로젝트의 생성 및 준비
     - Spring Legacy Project의 생성
     - pom.xml에서 스프링 버전 변경
     - spring-test, spring-jdbc, spring-tx 추가
     - junit버전 변경
     - servlet버전 변경
     - HikariCP, MyBatis, mybats-spring, Log4jdcb 추가
     - JDBC드라이버 프로젝트 내 추가
     - 기타 Lombok의 설정 등

------

- ### **2021-02-09**

  1. 비즈니스 계층(서비스 계층)
     - 고객의 요구사항을 반영하는 계층
     - 업무의 단위로 설계
       - 트랜잭션의 단위
     - 여러 개의 Mapper나 DAO를 사용하는 경우가 존재함
     - xxxService의 형태로 작성
  2. 서비스 패키지 설정
     - 인터페이스와 클래스를 설정하고, root-context.xml에 등록
       - <context:component-scan base-pakage="xxxxxxxx.service">

------

- ### 2021-02-15

1. BoardController의 등록 처리
   - POST방식으로 처리되는 데이터를 BoardVO 타입의 인스턴스로 바인딩해서 메서드에서 활용
   - BoardService를 이용해서 등록 처리
   - 'redirect:' 를 이용해서 다시 목록으로 이동

```java
@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("board: " + board);

		Long bno = service.register(board);
		log.info("BNO: " + bno);
		rttr.addFlashAttribute("result", bno);

		return "redirect:/board/list";
	}
```

2. POST방식 후 처리
   - 등록/수정/삭제의 최종 처리는 POST방식을 이용
   - 브라우저에는 어떤 결과를 보여줄 것인가?
     1. 별도의 결과 페이지를 만들어서 보여주는 방식
        - 회원 가입 완료 페이지 등
     2. 목록 페이지로 이동하는 방식
        - 목록 페이지에서 알림 메시짖를 보여주는 방식
   - POST방식 후에는 'redirect:/..' 를 고려하자
3. RedirectAttributes는 언제 사용하는가?
   - 시나리오
     - GET방식으로 입력페이지 /board/register
     - POST방식으로 입력 처리 /board/register
     - 처리가 끝난 후 화면 이동을 해도 브라우저의 URL은 POST방식 처리 URL 그대로
     - 만일 브라우저를 새로고침하면?
   - 'redirect:/..' 를 이용해서 브라우저와 연결을 한번 종료
   - 브라우저는 새롭게 특정 URL을 요구
4. JSTL를 통해 결과값을 표현
   - (JSTL 공부링크)[https://velog.io/@ye050425/JSP-JSTL-%EC%A0%95%EB%A6%AC](https://velog.io/@ye050425/JSP-JSTL-%EC%A0%95%EB%A6%AC)

------

- ### 2021-02-15

  - rttr.addAttribute
    - 전달한 값은 url뒤에 붙으며,  refresh해도 데이터가 유지된다.

  -  rttr.addFlashAttribute

    - 전달한 값은 url뒤에 붙지 않는다. 

      일회성이라 리프레시할 경우 데이터가 소멸한다.

      또한 2개이상 쓸 경우, 데이터는 소멸한다. 

      따라서 맵을 이용하여 한번에 값전달해야한다. 

      ##### ->즉 그냥 새로고침을하면 아무정보도 안뜨지만 

      ##### 글 등록/수정/삭제 후에 목록화면으로 이동하는 경우 "몇번째 게시글이 등록되었습니다"와 같은 모달정보 출력 시 매우 유용

  - 글 등록시 한글 깨짐 시

    ```xml
    <filter>
    		<filter-name>encoding</filter-name>
    		<filter-class>org.springframework.web.filter.CharacterEncodingFilter
    		</filter-class>
    		<init-param>
    			<param-name>encoding</param-name>
    			<param-value>UTF-8</param-value>
    		</init-param>
    	</filter>
    	<filter-mapping>
    		<filter-name>encoding</filter-name>
    		<servlet-name>appServlet</servlet-name>
    	</filter-mapping>
    ```

    - web.xml을 이용한 필터 설정을 한다.

