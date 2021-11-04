# iOS-Widget-Practice
Swift UI를 사용한 위젯 연습


# 정의

- iOS 홈 화면 또는 macOS 알림 센터에서 앱의 관련성 있고 한눈에 볼 수 있는 콘텐츠를 표시한다.

## OverView

- 위젯 킷은 iOS 홈 화면 또는 MacOS 알림센터에 위젯을 배치하여 사용자가 앱의 콘텐츠에 즉시 엑세스 할 수 있도록 한다.
- 위젯은 최신 상태를 유지하므로 사용자는 항상 최신 정보를 한 눈에 볼 수 있습니다. 더 자세한 정보가 필요하면 위젯이 앱의 적절한 위치로 이동시킵니다.
- 세 가지 다른 크기(small, medium, large)를 사용 할 수 있으므로 위젯을 광범위한 정보를 표시할 수 있다.
- 사용자는 위젯을 개인화 하여 필요에 맞는 세부 정보를 확인하고 가장 적합한 방식으로 위젯을 정렬할 수 있다.
- 사용자가 위젯을 쌓고 `Smart Rotate` 를 활성화하면 가장 관련성이 높은 위젯을 맨 위로 자동으로 회전하여 사용자가 정확한 시간에 가장 중요한 세부 정보를 볼 수 있도록 한다.
- 위젯을 구현하려면 앱에 Widget Extension을 추가합니다. `Timeline Provider`로 위젯을 구성하고 `Swift UI` `View` 를 사용하여 위젯의 콘텐츠를 표시합니다. `Timeline Provider` 는 위젯 콘텐츠를 업데이트 할 시기를 `Widget Kit`에 알려줍니다.

![Untitled](https://user-images.githubusercontent.com/71247008/140253522-178e7112-75f0-47cc-97bd-18b586611c33.png)

- 위젯을 사용자 구성 가능하게 만들려면 Extention에 `custom SiriKit` 정의를 추가합니다. `WidgetKit`은 사용자가 위젯을 개인화 할 수 있도록 사용자 정의 인터페이스를 자동으로 제공합니다.

---

## Creating a Widget Extension

- 앱에 위젯을 추가하려면 최소한의 설정과 사용자 인터페이스의 구성 및 스타일에 대한 몇 가지 결정이 필요합니다. 위젯은 `SwiftUI` 를 사용하여 콘텐츠를 표시합니다.
- `Widget Extension Template`은 위젯 생성을 위한 시작점을 제공합니다. `Single Widget Extension`에는 **여러 위젯이 포함 될 수 있습니다.**
- 순서
    1. Open your app project in Xcode and choose File > New > Target.
    (앱 프로젝트를 열고 File → New → Target)
    2. From the Application Extension group, select Widget Extension, and then click Next.
    (Apllication Extension Group에 Wiget Extension을 선택하고 Next 클릭)
    3. Enter the name of your extension.
    (Extension 이름 입력)
    4. If the widget provides user-configurable properties, check the Include Configuration Intent checkbox.
    (위젯이 사용자 구성 가능한 속성을 제공하려는 경우 Configuration을 선택한다.
    5. Click Finish.

### **Add Configuration Details**

- `Widget Extension Template`은 Widget 프로토콜을 준수하는 초기 위젯 구현을 제공합니다.
이 위젯 `body property`는 위젯에 사용자 구성 가능한 `Property`가 있는지 여부를 결정합니다.
두가지 종류의 `Configuration`을 사용할 수 있다.
    - StaticConfiguration: **사용자 구성 가능한 속성이 없는** 위젯의 경우.
    예를들어 시장 정보를 표시하는 주식 시장 위젯이나 트렌드 헤드라인을 표시하는 뉴스 위젯.
    - IntentConfiguration: **사용자 구성 가능한 속성이 있는** 위젯의 경우.
    SiriKit 사용자 정의 의도를 사용하여 속성을 정의합니다. 
    예를들어 도시의 우편번호가 필요한 날씨 위젯이나 추적 번호가 필요한 패키지 추적 위젯이 있습니다.
    
- `Include Configuration Intent CheckBox`는 Xcode가 사용하는 `Configuration`을 결정합니다.
이 확인란을 선택하면 Xcode는 `IntentConfiguration` 을 사용합니다. 그렇지않으면 `StaticConfiguration`을 사용합니다. Configuration을 초기화 하려면 다음 정보를 제공하세요.
    - Kind: 위젯을 식별하는 문자열입니다. 이것은 선택하는 식별자이며 위젯이 나타나는 내용을 설명해야 합니다.
    - Provider: `TimelineProvider`를 준수하고, 위젯을 렌더링할 시기를 `WidgetKit`에 알려주는 Timeline을 생성하는 개체입니다. 타임라인에는 사용자가 정의한 사용자 지정 `TimelineEntry`  유형이 포함되어있습니다. 타임라인 항목은 WidgetKit이 위젯의 콘텐츠를 업데이트하기를 원하는 날짜를 식별합니다. 위젯의 View가 사용자 정의 유형으로 렌더링해야 하는 속성을 포함합니다.
    - Content Closure: `SwiftUI View`를 포함하는 `Closure`. `WidgetKit`은 이를 호출하여, 위젯의 콘텐츠를 렌더링하고 `Provider`로 부터 `TimelineEntry` 매개변수를 전달합니다.
    - Custom Intent: `user-configurable property`를 정의하는 부분?.
- modifiers를 사용하여 이름, 설명, 위젯이 지원하는 제품군을 비롯한 추가 구성 세부 정보를 제공합니다.
    - modifiers에는 다양한 종류의 View modifiers가 있다.
        - configurationDisplayName
        위젯의 이름을 나타내는 `modifier`이다.
        - description
        위젯의 설명을 나타낸다.
        - supportedFamilies 
        위젯이 어떤 사이즈에 대응하는지 나타낸다.
        - 해당 설정들을 하면 위젯을 추가하는 부분에 정보들이 나타난다.
          ![asd](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/771b1082-2088-4c7c-9d54-ebe8c14c406e/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211104T033355Z&X-Amz-Expires=86400&X-Amz-Signature=1c7dbbe562f379c0ba6622ff570676506700e179e0bb4d269c5499307fec7b1f&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)
     


### Provide Timeline Entires

- `Timeline Provider`는 위젯의 콘텐츠를 업데이트 할 날짜와 시간을 각각 지정하는 `Timeline entry`를 생성합니다.
    
    ```swift
    struct GameStatusEntry: TimelineEntry {
        var date: Date
        var gameStatus: String
    }
    ```
    
- 위젯 갤러리에 위젯을 표시하기 위해 `Widget Kit`은 `Provider`에게 미리보기 스냅샷을 요청합니다. 
getSnapshot(in:completion:) 메서드에 전달된 `Context` 매개변수의 `isPreview` 프로퍼티를 확인하여 이 미리보기 요청을 식별합니다.
`isPriview`가 `true`면 WidgetKit은 위젯 갤러리에 위젯을 표시합니다.
이에대한 `response`로 `Proview Snapshot`을 빠르게 생성해야합니다.
만약 서버에서 데이터를 생성하거나, 가져오는데 시간이 오래걸릴 경우 `Sample Data`를 대신사용하세요.
