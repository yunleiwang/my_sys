# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    # 初始化菜单
    # Menu.create([
    #                 {name_cn: '控制台',name_en:'',link: '/home/index',seq:1,menu_id:0,menu_type:1,hidden:0},
    #                 {name_cn: '患者信息',name_en:'',link: '#',seq:2,menu_id:0,menu_type:1,hidden:0},
    #                 {name_cn: '患者信息',name_en:'',link: '/patients',seq:1,menu_id:2,menu_type:1,hidden:0},
    #                 {name_cn: '就诊信息',name_en:'',link: '#',seq:3,menu_id:0,menu_type:1,hidden:0},
    #                 {name_cn: '随访信息',name_en:'',link: '#',seq:4,menu_id:0,menu_type:1,hidden:0},
    #                 {name_cn: '系统管理',name_en:'',link: '#',seq:5,menu_id:0,menu_type:1,hidden:0},
    #                 {name_cn: '今日就诊',name_en:'',link: '/patient_visits/today_visits',seq:1,menu_id:4,menu_type:1,hidden:0},
    #                 {name_cn: '就诊列表',name_en:'',link: '/patient_visits',seq:2,menu_id:4,menu_type:1,hidden:0},
    #                 {name_cn: '菜单管理',name_en:'',link: '/menus',seq:1,menu_id:6,menu_type:1,hidden:0},
    #                 {name_cn: '用户管理',name_en:'',link: '#',seq:2,menu_id:6,menu_type:1,hidden:0},
    #                 {name_cn: '角色管理',name_en:'',link: '#',seq:1,menu_id:11,menu_type:1,hidden:0},
    #                 {name_cn: '用户列表',name_en:'',link: '#',seq:2,menu_id:11,menu_type:1,hidden:0},
    #                 {name_cn: '表单管理',name_en:'',link: '#',seq:3,menu_id:6,menu_type:1,hidden:0},
    #                 {name_cn: '字典库管理',name_en:'',link: '#',seq:4,menu_id:6,menu_type:1,hidden:0},
    #                 # {name_cn: '主诉及现病史',name_en:'',link: '#',seq:1,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '并发症病史和其他病史及相关治疗',name_en:'',link: '#',seq:2,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '个人史',name_en:'',link: '#',seq:3,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '体格检查',name_en:'',link: '#',seq:4,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '辅助检查',name_en:'',link: '#',seq:5,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '病情评估',name_en:'',link: '#',seq:6,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '治疗',name_en:'',link: '#',seq:7,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '标本记录',name_en:'',link: '#',seq:8,menu_id:0,menu_type:2,hidden:0},
    #                 # {name_cn: '基本情况',name_en:'',link: '#',seq:1,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '预后',name_en:'',link: '#',seq:2,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '合并症情况',name_en:'',link: '#',seq:3,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '诊断',name_en:'',link: '#',seq:4,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '体格检查',name_en:'',link: '#',seq:5,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '实验室及辅助检查',name_en:'',link: '#',seq:6,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '病情问卷评估',name_en:'',link: '#',seq:7,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '治疗情况',name_en:'',link: '#',seq:8,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '标本记录',name_en:'',link: '#',seq:9,menu_id:0,menu_type:3,hidden:0},
    #                 # {name_cn: '菜单管理',name_en:'',link: '#',seq:9,menu_id:6,menu_type:1,hidden:0},
    #                 # {name_cn: '随访方案',name_en:'',link: '/follow_programs',seq:2,menu_id:5,menu_type:1,hidden:0},
    #                 # {name_cn: '待随访列表',name_en:'',link: '/follow_ups',seq:1,menu_id:5,menu_type:1,hidden:0},
    #
    #             ])
    # 创建出事用户,用户名admin,密码123456
    User.create([
                   {username: 'admin',encrypted_password:'$2a$11$B.CX1qPIHc/2ZKjcseNrl.ak6yAVK2GfCNlXmG/OmudhaXzFGMOqy'}
               ])

    # 初始化字典库
    # 学历：学龄前、小学、初中、高中、中技、中专、大专、本科、博士、博士后、硕士、文盲、其他
    # 职业：国家公务员、专业技术人员、职员、企业管理人员、工人、农民、学生、现役军人、自由职业者、个体经营者、无业人员、退（离）休人员、其他
    # 婚姻状况：未婚、已婚、丧偶、离婚、其他
    # 病人来源：急诊、门诊、病房、其他医疗机构转入、其他
    # 1、睡眠呼吸障碍
    # （1）、类型：□正常   □鼾症   □阻塞   □中枢    □混合
    # （2）、程度：□轻度   □中度   □重度
    # （3）、缺氧：□正常   □轻度   □中度   □重度

    # PublicLib.create([
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "学龄前", item_value: "学龄前"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "小学", item_value: "小学"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "初中", item_value: "初中"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "高中", item_value: "高中"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "中技", item_value: "中技"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "中专", item_value: "中专"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "大专", item_value: "大专"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "本科", item_value: "本科"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "博士", item_value: "博士"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "博士后", item_value: "博士后"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "硕士", item_value: "硕士"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "文盲", item_value: "文盲"},
    #                      {table_name: "patient_visits", item_name: "degree_of_education", item_text: "其他", item_value: "其他"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "国家公务员", item_value: "国家公务员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "专业技术人员", item_value: "专业技术人员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "职员", item_value: "职员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "企业管理人员", item_value: "企业管理人员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "工人", item_value: "工人"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "农民", item_value: "农民"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "学生", item_value: "学生"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "现役军人", item_value: "现役军人"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "自由职业者", item_value: "自由职业者"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "个体经营者", item_value: "个体经营者"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "无业人员", item_value: "无业人员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "退（离）休人员", item_value: "退（离）休人员"},
    #                      {table_name: "patient_visits", item_name: "occupation", item_text: "其他", item_value: "其他"},
    #                      {table_name: "patient_visits", item_name: "marital_status", item_text: "未婚", item_value: "未婚"},
    #                      {table_name: "patient_visits", item_name: "marital_status", item_text: "已婚", item_value: "已婚"},
    #                      {table_name: "patient_visits", item_name: "marital_status", item_text: "丧偶", item_value: "丧偶"},
    #                      {table_name: "patient_visits", item_name: "marital_status", item_text: "离婚", item_value: "离婚"},
    #                      {table_name: "patient_visits", item_name: "marital_status", item_text: "其他", item_value: "其他"},
    #                      {table_name: "patient_visits", item_name: "patient_source", item_text: "急诊", item_value: "急诊"},
    #                      {table_name: "patient_visits", item_name: "patient_source", item_text: "门诊", item_value: "门诊"},
    #                      {table_name: "patient_visits", item_name: "patient_source", item_text: "病房", item_value: "病房"},
    #                      {table_name: "patient_visits", item_name: "patient_source", item_text: "其他医疗机构转入", item_value: "其他医疗机构转入"},
    #                      {table_name: "patient_visits", item_name: "patient_source", item_text: "其他", item_value: "其他"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_types", item_text: "正常", item_value: "正常"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_types", item_text: "鼾症", item_value: "鼾症"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_types", item_text: "阻塞", item_value: "阻塞"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_types", item_text: "中枢", item_value: "中枢"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_types", item_text: "混合", item_value: "混合"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_degree", item_text: "轻度", item_value: "轻度"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_degree", item_text: "中度", item_value: "中度"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_degree", item_text: "重度", item_value: "重度"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_anoxia", item_text: "正常", item_value: "正常"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_anoxia", item_text: "轻度", item_value: "轻度"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_anoxia", item_text: "中度", item_value: "中度"},
    #                      {table_name: "patient_visits", item_name: "diagnosetic_anoxia", item_text: "重度", item_value: "重度"}
    #                  ])
