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

1.

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

   

2.

   ```java
   @Component
   @ToString
   @RequiredArgsConstructor
   public class SampleHotel {
   
   	private final Chef chef;
   
   }
   
   ```

   1번과 2번 같은 의미이나, 2번을 더 자주 사용하는 추세

   

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



