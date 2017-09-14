class Observe < ActiveRecord::Base
   ATTACK_SHOW =  ["1.先兆","2.意识清楚","3.意识模糊","4.意识丧失","5.肢体强直","6.肢体阵挛","7.肢体肌阵挛","8.躯干和肢体痉挛","9.口角阵挛","10.眼角阵挛","11.双眼凝视","12.双眼紧闭","13.牙关紧闭","14.流涎/吐沫","15.眼偏转","16.头偏转","17.发绀","18.大小便失禁","19.其他"]
   CAUSE = ["1、疲劳","2、兴奋",  "3、惊吓", "4、抑郁", "5、暴躁",  "6、焦虑",  "7、外伤", "8、环境改变", "9、饮食不当",  "10、饥饿", "11、呼吸道疾病",  "12、消化道疾病", "13、心脏疾病",  "14、其他系统疾病"]
   ENVIRONMENT = ["1、寒冷","2、暑热",  "3、伤风", "4、光刺激", "5、声音刺激",  "6、嗅觉刺激",  "7、味觉刺激"]

end
