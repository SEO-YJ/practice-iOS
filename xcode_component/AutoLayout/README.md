# AutoLayout
 위 페이지는 AutoLayout에 관한 내용과 각 component에 AutoLayout를 적용할 때의 특징들을 정리한 페이지입니다.     
      
## AutoLayout이란?
: 개발자가 각각의 뷰에 의도를 지정해주면 기기마다 자동으로 뷰들을 위치시켜주는 기술    
      
## AutoLayout의 목적
: 기기마다 화면의 해상도가 다르다. 그래서, AutoLayout이 없으면 기기 별로 화면을 구성해줘야 한다.     
그러나, AutoLayout을 사용하면 자동으로 개발자의 의도에 맞게 화면이 출력되게 할 수 있다.     
      
**_개발자의 의도?_**     
ex> 모든 기기에서 버튼이 우측 상단에 위치하게 하고 싶다.      
ex> 이미지를 정가운데에 위치하게 하고 싶다.     
ex> 글자를 좌측하단에 위치하게 하고 싶다.      
이러한 의도를 AutoLayout을 사용하면, **"단 하나의 화면"** 작업만으로 모든 기기에서 의도에 맞게 화면이 출력되게 할 수 있다.    
     
**_AutoLayout이 없으면?_**     
: Xcode의 작업 해상도는 **"정적"** 이다.     
이를 **"기본 프레임 기반 레이아웃의 문제"** 라고 하자.    
이에 따른 문제는 아래와 같다.    
1. 동적으로 뷰를 위치 시킬 수 없다.    
-> 모두 정적으로 뷰가 위치한다.     
2. 기기에 맞는 화면 별로 일일히 계산하여 뷰를 위치시켜줘야 한다.    
-> 작업시간이 대폭 상승한다.    
         
따라서, 애플의 기기는 매우 많고, 앞으로도 계속 출시될 것인데, 기기에 따라 해상도는 다르기에      
기기별로 해상도에 맞게 화면을 구성하려면,      
1. 기기에 맞는 해상도에 따라 수십개의 화면 작업을 진행한다.     
2. AutoLayout을 사용하여 단 한 번의 작업만 진행한다.     
우리는 작업의 효율을 위해 AutoLayout을 꼭 이해하고 적용하자!      
     
## AutoLayout 사용방법
1. 제약사항(Constraint)으로 뷰들에 제약사항을 걸어준다.      
2. AutoLayout을 적용할 뷰들은 꼭 위치, 크기가 지정되어야 한다.     

## 강사님의 AutoLayout 설정 방법
1) Navigation에서 AutoLayout 걸 컴포넌트 찾기      
    2-1) 컴포넌트끼리 Constraints 걸어줄 경우: 컴포넌트 클릭 -> control+드래그 -> 다른 컴포넌트      
    2-2) Height, Width 설정: control+드래그      
2)  여러 Constraints 동시에 설정할 경우: Shift 누른 상태에서 선택      
       
## Component 별로 AutoLayout 적용 방법
### Label
**_특징_**    
* 크기     
    Width
    1. 글자 수에 따라 Label의 Width 값이 바뀐다.     
    2. 글자 수가 매우 많아져도, 개발자가 줄바꿈하지 않는 이상 다음 칸으로 넘어가지 않는다.     
     
    Height
    1. 폰트의 크기에 따라 결정된다.      
    2. **"Lines"** 에서 줄 바꿈을 하면, Height의 값이 늘어난다.     

* 위치     
    위치는 제약사항에 따라 달라진다.     
     
* 제약사항
1. Top, Bottom, Trailing, Leading 다 제약사항 걸어줄 경우
    시뮬레이터 > 작업화면
    : "크기"는 변화없고, 제약사항의 값이 비율적으로 증가하여 Label이 위치한다.      
    
    시뮬레이터 < 작업화면
    :  
    Unable to simultaneously satisfy constraints.     
        Probably at least one of the constraints in the following list is one you don't want.     
    Try this:       
        (1) look at each constraint and try to figure out which you don't expect;        
        (2) find the code that added the unwanted constraint or constraints and fix it.         
         
    에러가 발생한다. (시뮬레이터에 컴포넌트가 나오지 않는다.)     
    아마, 상하좌우 모두 제약사항을 걸어주면, "unwanted constraint or constraints"를 수정해야 한다는 것을 알 수 있다.   
    그러므로, 작업화면보다 작은 휴대폰의 해상도를 위해     
    **"상하좌우에 모두 제약사항을 걸지 말자."**            
    
2. Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어줄 경우    
    시뮬레이터 > 작업화면     
    : "크기"는 변화없고,    
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져 있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 늘어난 것을 확인할 수 있다.     
    
    시뮬레이터 < 작업화면
    : "크기"는 변화없고,       
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 줄어든 것을 확인할 수 있다.

**_결론_**    
: Label은 크기가 **"고정"** 이 되어있다.     
Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어주어야    
개발자의 의도에 맞게 AutoLayout을 적용할 수 있다.     

### Button     
**_특징_**    
* 크기     
    Width
    1. 글자 수에 따라 Button의 Width 값이 바뀐다.     
    2. 글자 수가 매우 많아져도, 개발자가 줄바꿈하지 않는 이상 다음 칸으로 넘어가지 않는다.     
    3. AutoLayout으로 크기를 조절해도 Button 내부의 글자보다는 크기가 작아지지 않는다.     
    4. AutoLayout으로 Button의 Width를 조절할 수 있다.
    
     
    Height
    1. 폰트의 크기에 따라 결정된다.      
    2. Button -> Title 에서 ctrl+enter로 줄 바꿈을 하면, Button 내부의 글자가 줄 바꿈이 되어
    Height의 값이 늘어난다.     
    3. AutoLayout으로 크기를 조절해도 Button 내부의 글자보다는 크기가 작아지지 않는다.      
    4. AutoLayout으로 Button의 Height를 조절할 수 있다.    
    
    결론
    1. **Button의 크기는 고정되어 있지 않다.**    
    2. Button의 최소 크기는 글자의 크기보다 작아지지 않는다.    
    3. AutoLayout으로 Button의 크기를 조절할 수 있다.     
    

* 위치     
    위치는 제약사항에 따라 달라진다.     
     
* 제약사항
1. Top, Bottom, Trailing, Leading 다 제약사항 걸어줄 경우
    시뮬레이터 > 작업화면
    : "크기"가 비율적으로 커진다.    
    왜냐하면, Button의 크기는 고정되어 있지 않기에,    
    상하좌우에 모두 제약사항을 걸어줄 경우, 휴대폰의 해상도가 커지면 Button의 크기도 비율적으로 증가한다.     
    
    시뮬레이터 < 작업화면
    : "크기"가 비율적으로 작아진다.    
    왜냐하면, Button의 크기는 고정되어 있지 않기에,    
    상하좌우에 모두 제약사항을 걸어줄 경우, 휴대폰의 해상도가 작아지면 Button의 크기도 비율적으로 감소한다.     
    그러나, 아무리 작아져도 Button 내부의 글자의 크기보다 작아지지 않는다.       
    
2. Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어줄 경우    
    시뮬레이터 > 작업화면     
    : "크기"는 **글자에 맞게 최소 크기로 작아진다.**         
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져 있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 늘어난 것을 확인할 수 있다.     
    
    시뮬레이터 < 작업화면
    : "크기"는 **글자에 맞게 최소 크기로 작아진다.**     
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 줄어든 것을 확인할 수 있다.

**_결론_**    
: Button은 크기가 **"고정"** 이 되어있지 않다.      
      
1. Button의 크기를 휴대폰의 해상도에 따라서 달라지게 사용하고 싶으면,     
    높이만 변동주고 싶을 경우      
    Top, Bottom에 모두 제약사항, Trailing, Leading 중 1개 제약사항 걸기       
    
    너비만 변동주고 싶을 경우      
    Top, Bottom 중 1개 제약사항 걸기, Trailing, Leading에 모두 제약사항 걸기      
    
    높이, 너비 모두 변동주고 싶을 경우      
    Top, Bottom, Trailing, Leading 모두 제약사항 걸기      
        
2. Button의 크기를 휴대폰의 해상도에 따라서 달라지지 않게 사용하고 싶으면,     
    Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어주고,      
    **"Width, Height 제약사항"** 을 걸어주어야 한다.    
    개발자의 의도에 맞게 AutoLayout을 적용할 수 있다.     

### Image View      
**_특징_**    
* 크기     
    Width
    1. 너비가 고정되어 있지 않다.     
    2. AutoLayout으로 Image View의 Width를 조절할 수 있다.
    3. 최소 크기가 없다. (AutoLayout을 잘못 설정하면 Image View가 안 보일 수 도 있다.)      
    Height
    1. 높이가 고정되어 있지 않다.     
    2. AutoLayout으로 Image View의 Height를 조절할 수 있다.    
    3. 최소 크기가 없다. (AutoLayout을 잘못 설정하면 Image View가 안 보일 수 도 있다.)      
    
    결론      
    1. **Image View의 크기는 고정되어 있지 않다.**    
    2. AutoLayout으로 Image View의 크기를 조절할 수 있다.     
    3. 최소 크기가 없어 AutoLayout을 잘 못 설정하면 View가 화면에서 사라질 수 있다.     
    

* 위치     
    위치는 제약사항에 따라 달라진다.     
     
* 제약사항
1. Top, Bottom, Trailing, Leading 다 제약사항 걸어줄 경우
    시뮬레이터 > 작업화면
    : "크기"가 비율적으로 커진다.    
    왜냐하면, Image View의 크기는 고정되어 있지 않기에,    
    상하좌우에 모두 제약사항을 걸어줄 경우, 휴대폰의 해상도가 커지면 Image View의 크기도 비율적으로 증가한다.     
    
    시뮬레이터 < 작업화면
    : "크기"가 비율적으로 작아진다.    
    왜냐하면, Image View의 크기는 고정되어 있지 않기에,    
    상하좌우에 모두 제약사항을 걸어줄 경우, 휴대폰의 해상도가 작아지면 Image View의 크기도 비율적으로 감소한다.     
    AutoLayout을 잘 못 설정하면 View가 사라질 수 도 있으니 주의하자.       
    
2. Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어줄 경우    
    시뮬레이터 > 작업화면     
    : "크기"는 **이미지가 조금 보일 정도로 최소 크기로 작아진다.**         
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져 있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 늘어난 것을 확인할 수 있다.     
    
    시뮬레이터 < 작업화면
    : "크기"는 **이미지가 조금 보일 정도로 최소 크기로 작아진다.**     
    제약사항을 걸어준 부분은 제약사항 크기만큼 떨어져있고,     
    제약사항을 걸어주지 않은 부분은 휴대폰의 해상도에 맞게 공백이 줄어든 것을 확인할 수 있다.

**_결론_**    
: Image View은 크기가 **"고정"** 이 되어있지 않다.      
      
1. Image View의 크기를 휴대폰의 해상도에 따라서 달라지게 사용하고 싶으면,     
    높이만 변동주고 싶을 경우      
    Top, Bottom에 모두 제약사항, Trailing, Leading 중 1개 제약사항 걸기       
    그러나, Image View는 내부의 이미지가 깨질 우려가 있으므로 위 방법 사용 X
    
    너비만 변동주고 싶을 경우      
    Top, Bottom 중 1개 제약사항 걸기, Trailing, Leading에 모두 제약사항 걸기      
    그러나, Image View는 내부의 이미지가 깨질 우려가 있으므로 위 방법 사용 X
    
    높이, 너비 모두 변동주고 싶을 경우      
    Top, Bottom, Trailing, Leading 모두 제약사항 걸기      
    주로, Stack View 등에 상하좌우 제약사항을 0으로 걸어서 사용하는 경우가 많은 것 같다.     
    이렇게 사용해야 내부 이미지의 비율이 안 깨지고 사용하기 용이하다.      
        
2. Image View의 크기를 휴대폰의 해상도에 따라서 달라지지 않게 사용하고 싶으면,     
    Top, Bottom 중 1개, Trailing, Leading 중 1개 제약사항 걸어주고,      
    **"Width, Height 제약사항"** 을 걸어주어야 한다.    
    개발자의 의도에 맞게 AutoLayout을 적용할 수 있다.     

### Aspect Ratio
Aspect: 측면       
Ratio: 비율     
: 비율을 설정하면, 컴포넌트의 크기가 비율을 유지한다.     

 
 
 

