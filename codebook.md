# Code Book

## Data Processing
### Recode responses

- integer[1-7]

数值  | Q#1-Q#50 |Q#53 income | Q#54 education 
------|----------|------------|--------------------
1     | 强烈反对 | 0-25k      | 初中及以下
2     | 反对     | 25k-50k    | 高中
3     | 同意     | 50k-75k    | 大学
4     | 强烈同意 | 75k-100k   | 研究生及以上
5     |          | 100k-150k  | 
6     |          | 150k-300k  |
7     |          | 300k+      | 

- Q#51 sex is recoded based on {'Female' -> 'F', 'Male' -> 'M'}
- Q#52 birthyear is not changed

### Infer location from IP address
- Use Maxmind GeoIP2 Free City Data to translate IP into country, province, city, latitude, longitude
- precision is about 50%-80%

## 变量列表及对应问卷中的问题

variable             | Q# | 问题
---------------------|----|-----------------------------------------------------------------------------------------
voting               | 1  | 如果人民没有受过民主教育，他们是不应该拥有普选权的。
human_rights         | 2  | 人权高于主权。
information          | 3  | 发生重大社会安全事件时，即使认为信息公开会导致骚乱的风险，政府仍应该开放信息传播。
multi_party          | 4  | 西方的多党制不适合中国国情。
freedom_of_speech    | 5  | 在中国照搬西方式的言论自由会导致社会失序。
college_exam         | 6  | 由高校自主考试招生比全国统一考试招生更好。
religion             | 7  | 应该容许宗教人士在非宗教场所公开传教。
military_training    | 8  | 无论中小学生或大学生，都应参加由国家统一安排的军训。
national_unity       | 9  | 国家的统一和领土完整是社会的最高利益。
due_process          | 10 | 哪怕经历了违反程序规定的审讯和取证过程，确实有罪的罪犯也应被处刑。
foreign_aid          | 11 | 国家有义务进行对外援助。
leader               | 12 | 国家领导人及开国领袖的形象可以作为文艺作品的丑化对象。
lynch                | 13 | 当法律未能充分制止罪恶行为时，人民群众有权自发对罪恶行为进行制裁。
media_interest       | 14 | 应当允许媒体代表某一特定阶层或利益集团发言。
national_interest    | 15 | 如果国家综合实力许可，那么中国有权为了维护自己的利益而采取任何行动。
military_taiwan      | 16 | 条件允许的话应该武力统一台湾。
lawyer               | 17 | 律师即使明知被辩护人的犯罪事实也应当尽力为其进行辩护。
foreign_nationality  | 18 | 应该允许中国公民同时具有外国国籍。
china_power          | 19 | 以美国为首的西方国家不可能真正容许中国崛起成为一流强国。
sports               | 20 | 国家应当采取措施培养和支持体育健儿在各种国际比赛场合为国争光。
minimum_wage         | 21 | 最低工资应由国家规定。
reform_benefit       | 22 | 中国改革开放以来的经济发展的成果都被一小群人占有了，大多数人没得到什么好处。
collective_interest  | 23 | 在重大工程项目的决策中，个人利益应该为社会利益让路。
waste_food           | 24 | 浪费粮食也是个人的自由。
pork                 | 25 | 如果猪肉价格过高，政府应当干预。
tariff               | 26 | 应当对国外同类产品征收高额关税来保护国内民族工业。
public_education     | 27 | 教育应当尽可能公立。
soe_national_interest| 28 | 国有企业的利益属于国家利益。
real_estate          | 29 | 试图控制房地产价格的行为会破坏经济发展。
low_income           | 30 | 改善低收入者生活的首要手段是国家给予财政补贴和扶持。
medical              | 31 | 有钱人理应获得更好的医疗服务。
income_source        | 32 | 高收入者应该公开自己的经济来源。
finance_sector       | 33 | 靠运作资金赚钱的人对社会的贡献比不上靠劳动赚钱的人。
soe_sell_capitalist  | 34 | 与其让国有企业亏损破产，不如转卖给资本家。
soe_national_security| 35 | 那些关系到国家安全、以及其他重要国计民生的领域，必须全部由国有企业掌控。
capital_cumulation   | 36 | 资本积累的过程总是伴随着对普通劳动人民利益的伤害。
land_ownership       | 37 | 私人应当可以拥有和买卖土地。
grain_price          | 38 | 政府应当采用较高的粮食收购价格以增加农民收入。
foreign_capital      | 39 | 在华外国资本应享受和民族资本同样的待遇。
monopoly             | 40 | 市场竞争中自然形成的垄断地位是无害的。
voluntary_sex        | 41 | 两个成年人之间自愿的性行为是其自由，无论其婚姻关系为何。
older_generation     | 42 | 不应公开谈论自己长辈的缺点。
confucianism         | 43 | 现代中国社会需要儒家思想。
art                  | 44 | 判断艺术作品的价值的根本标准是看是不是受到人民大众喜爱。
birth_control        | 45 | 即使有人口压力，国家和社会也无权干涉个人要不要孩子，要几个孩子。
zhouyi               | 46 | 周易八卦能够有效的解释很多事情。
chinese_medicine     | 47 | 中国传统医学对人体健康的观念比现代主流医学更高明。
simplify_chinese     | 48 | 汉字无需人为推行简化。
classic_literature   | 49 | 应当将中国传统文化的经典作品作为儿童基础教育读物。
homosexual           | 50 | 如果是出于自愿，我会认可我的孩子和同性结成伴侣关系。
sex                  | 51 | 性别
birthyear            | 52 | 出生年份
income               | 53 | 年收入
education            | 54 | 学历
id                   | -  | 编号
time                 | -  | 问卷提交时间
ip                   | -  | 问卷提交IP地址
country              | -  | 国家
province             | -  | 省份
city                 | -  | 城市
latitude             | -  | 纬度
longitude            | -  | 经度
