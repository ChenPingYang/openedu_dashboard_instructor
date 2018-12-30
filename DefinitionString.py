from GlossaryObject import GlossaryObject


class DefinitionString:
    _gList = []

    def __init__(self):
        self._gList.append(GlossaryObject(
            0, "課程參與度"	, "課程的參與度。", self.link(1, "人數指標") + "(c)*0.2 + " + self.link(2, "登入指標") +
            "*0.2 + " + self.link(3, "參與指標") + "*0.6")
        )
        self._gList.append(GlossaryObject(
            1, "人數指標", "對於註冊人數計算出一個分數。", " 若" + self.link(4, "註冊人數") +
            "'c' >= 2000人，分數以100分計算；<br>若註冊人數'c' <= 100人，分數以(c*60) /100的公式去計算；"
            "<br>註冊人數'c'在100~2000之間，則用60 + (c-60)/(2000-100)的公式去計算。")
        )
        self._gList.append(GlossaryObject(
            2, "登入指標", "對於登入人數計算出一個分數。 ", "'X'為" + self.link(18, "課程影片數目") + "，'Y'為" +
            self.link(12, "練習題數量") + "，'Z'為" + self.link(10, "討論區發文數") + "，將'XYZ'三個數max()後乘以" +
            self.link( 4, "註冊人數") + "後即為期望登入人數'd'；<br>課程總登入次數為'y'。y/d 即為登入指標的分數，分數大於100以100計算。")
        )
        self._gList.append(GlossaryObject(
            3, "參與指標" 		,"對於影片觀看、練習題作答、討論區情況計算出一個分數。",
            "計算原則：實際數量/期望參與數量 * 100<br>a = 影片觀看度，b = 作答度，c = 討論度<br>計分方式："
            " a * 0.34 + b * 0.33 + c * 0.33 <br>1. a 影片觀看度<br>&nbsp;&nbsp;&nbsp;&nbsp;" +
            self.link(21, "影片觀看人次") + " / " + self.link(18, "課程影片數目") + " * " +
            self.link(4, "註冊人數") + " * 100<br>2. b 作答度<br>&nbsp;&nbsp;&nbsp;&nbsp;" +
            self.link(14, "總作答數") + " / " + self.link(12, "練習題數量") + " * " +
            self.link(4, "註冊人數") + " * 100<br>3. c 討論度<br>&nbsp;&nbsp;&nbsp;&nbsp;" +
            self.link(9, "討論區回應數") + " / (" + self.link(10, "討論區發文數") + " * " + self.link(4, "註冊人數") +
            " / 4) * 100 //期待四個發文回應一次。")
        )
        self._gList.append(GlossaryObject(
            4, "註冊人數", "選修課程總人數，需扣除退選人數 。", "總選修人數 - " + self.link(6, "退選人數"))
        )
        self._gList.append(GlossaryObject(
            5, "開課週數", "課程開課期間經過了幾週。")
        )
        self._gList.append(GlossaryObject(
            6, "退選人數", "選修課程但取消註冊之總人數。")
        )
        self._gList.append(GlossaryObject(
            7, "證書人數", "取得課程認證人數。")
        )
        self._gList.append(GlossaryObject(
            8, "討論區參與度", "學習者在討論區的參與度。", "討論區回應數/(討論區發文數*註冊人數)*100 (單位是%)")
        )
        self._gList.append(GlossaryObject(
            9, "討論區回應數", "學習者對於發文的總回應數。")
        )
        self._gList.append(GlossaryObject(
            10, "討論區發文數", "課程討論區的發文總數。")
        )
        self._gList.append(GlossaryObject(
            11, "討論區討論次數", "討論區的所有活動次數。", self.link(9, "討論區回應數") + " + " + self.link(10, "討論區發文數"))
        )
        self._gList.append(GlossaryObject(
            12, "練習題數量", "課程練習題總數。")
        )
        self._gList.append(GlossaryObject(
            13, "作答過半人數", "學習者作答超過一半測驗題的人數。")
        )
        self._gList.append(GlossaryObject(
            14, "總作答數", "所有學習者的作答題數總和。")
        )
        self._gList.append(GlossaryObject(
            15, "平均作答數", "所有學習者的平均做答題數 。", self.link(14, "總作答數") + " / " + self.link (4, "註冊人數"))
        )
        self._gList.append(GlossaryObject(
            16, "練習題作答率", "學習者平均作答數與練習題數量的比例。 ", self.link(15, "平均作答數") + " / " + self.link(12, "練習題數量"))
        )
        self._gList.append(GlossaryObject(
            17, "練習題答對率", "學習者總答對題數與練習題數量的比例。 ","總答對題數 / " + self.link(12, "練習題數量"))
        )
        self._gList.append(GlossaryObject(
            18, "課程影片數目", "課程影片的數量。")
        )
        self._gList.append(GlossaryObject(
            19, "影片平均長度", "所有影片的平均長度，單位秒。 ","sum(影片長度) / " + self.link(18, "課程影片數目"))
        )
        self._gList.append(GlossaryObject(
            20, "影片觀看人數", "學習者觀看影片的人數，一位學習者算一個人數。")
        )
        self._gList.append(GlossaryObject(
            21, "影片觀看人次", "學習者觀看影片的次數，一位學習者可能會計算超過一次。")
        )
        self._gList.append(GlossaryObject(
            22, "影片觀看過半人數", "學習者觀看超過（含）一半課程影片數目的人數。")
        )
        self._gList.append(GlossaryObject(
            23, "學生影片觀看平均數", "所有學習者的影片觀看平均。", self.link(21, "影片觀看人次") + " / " + self.link(4, "註冊人數"))
        )

    def getGlossaryList(self):
        return self._gList

    def getDefinitionList(self):
        dl = []
        for i in range(len(self._gList)):
            dl.append(self._gList[i].definition)

        return dl

    def getCalculation(self):
        cl = []
        for i in range(len(self._gList)):
            if self._gList[i].calculation == None:
                cl.append("&nbsp;&nbsp;&nbsp;&nbsp;無")
            else:
                cl.append("&nbsp;&nbsp;&nbsp;&nbsp;" + self._gList[i].calculation)

        return cl

    @staticmethod
    def link(id_, name):
        # return "<a href=\"GlossaryServlet?id=" + id_ + "\">" + name + "</a>";
        # return "<a>" + name + "</a>";
        return name