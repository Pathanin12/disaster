import '../model/profileusermodel.dart';

String url = "https://disastermoiapi.aicard.work/API/";
String pathQR = 'https://disastermoi.aicard.work/#/Detail?id=';
String pathQRfreeform = 'https://disasterweb.netlify.app/detailfreeform/';
String urlApiKey = 'http://cloud-api.win-victor.com/api/integrate/auth/';
double latDefault=13.732514;
double lngDefault=100.481309;
bool isAdmin = true;
bool isVillager = false;
// ProfileSaveModel? dataUser;
List<String> listIconType=[
  "assets/icons/icon/icon1.svg",
  "assets/icons/icon/icon2.svg",
  "assets/icons/icon/icon3.svg",
  "assets/icons/icon/icon4.svg",
  "assets/icons/icon/icon5.svg",
  "assets/icons/icon/icon6.svg",
  "assets/icons/icon/icon7.svg",
  "assets/icons/icon/icon8.svg",
  "assets/icons/icon/icon9.svg",
  "assets/icons/icon/icon10.svg",
  "assets/icons/icon/icon11.svg",
  "assets/icons/icon/icon12.svg",
  "assets/icons/icon/icon13.svg",
  "assets/icons/icon/icon14.svg",
  "assets/icons/icon/icon15.svg",
  "assets/icons/icon/icon16.svg",
  "assets/icons/icon/icon17.svg",
  "assets/icons/icon/icon18.svg",
  "assets/icons/icon/icon19.svg",
  "assets/icons/icon/icon20.svg",
  "assets/icons/icon/icon21.svg",
  "assets/icons/icon/icon22.svg",
  "assets/icons/icon/icon23.svg",
  "assets/icons/icon/icon24.svg",
  "assets/icons/icon/icon25.svg",
  "assets/icons/icon/icon26.svg",
  "assets/icons/icon/icon27.svg",
  "assets/icons/icon/icon28.svg",
  "assets/icons/icon/icon29.svg",
  "assets/icons/icon/icon30.svg",
  "assets/icons/icon/icon31.svg",
  "assets/icons/icon/icon32.svg",
  "assets/icons/icon/icon33.svg",
  "assets/icons/icon/icon34.svg",
  "assets/icons/icon/icon35.svg",
  "assets/icons/icon/icon36.svg",
];

List<Province> provinceList = [
  {
    "id": 1,
    "name_th": "กรุงเทพมหานคร",
    "name_en": "Bangkok",
  },
  {
    "id": 2,
    "name_th": "สมุทรปราการ",
    "name_en": "Samut Prakan",
  },
  {
    "id": 3,
    "name_th": "นนทบุรี",
    "name_en": "Nonthaburi",
  },
  {
    "id": 4,
    "name_th": "ปทุมธานี",
    "name_en": "Pathum Thani",
  },
  {
    "id": 5,
    "name_th": "พระนครศรีอยุธยา",
    "name_en": "Phra Nakhon Si Ayutthaya",
  },
  {
    "id": 6,
    "name_th": "อ่างทอง",
    "name_en": "Ang Thong",
  },
  {
    "id": 7,
    "name_th": "ลพบุรี",
    "name_en": "Loburi",
  },
  {
    "id": 8,
    "name_th": "สิงห์บุรี",
    "name_en": "Sing Buri",
  },
  {
    "id": 9,
    "name_th": "ชัยนาท",
    "name_en": "Chai Nat",
  },
  {
    "id": 10,
    "name_th": "สระบุรี",
    "name_en": "Saraburi",
  },
  {
    "id": 11,
    "name_th": "ชลบุรี",
    "name_en": "Chon Buri",
  },
  {
    "id": 12,
    "name_th": "ระยอง",
    "name_en": "Rayong",
  },
  {
    "id": 13,
    "name_th": "จันทบุรี",
    "name_en": "Chanthaburi",
  },
  {
    "id": 14,
    "name_th": "ตราด",
    "name_en": "Trat",
  },
  {
    "id": 15,
    "name_th": "ฉะเชิงเทรา",
    "name_en": "Chachoengsao",
  },
  {
    "id": 16,
    "name_th": "ปราจีนบุรี",
    "name_en": "Prachin Buri",
  },
  {
    "id": 17,
    "name_th": "นครนายก",
    "name_en": "Nakhon Nayok",
  },
  {
    "id": 18,
    "name_th": "สระแก้ว",
    "name_en": "Sa Kaeo",
  },
  {
    "id": 19,
    "name_th": "นครราชสีมา",
    "name_en": "Nakhon Ratchasima",
  },
  {
    "id": 20,
    "name_th": "บุรีรัมย์",
    "name_en": "Buri Ram",
  },
  {
    "id": 21,
    "name_th": "สุรินทร์",
    "name_en": "Surin",
  },
  {
    "id": 22,
    "name_th": "ศรีสะเกษ",
    "name_en": "Si Sa Ket",
  },
  {
    "id": 23,
    "name_th": "อุบลราชธานี",
    "name_en": "Ubon Ratchathani",
  },
  {
    "id": 24,
    "name_th": "ยโสธร",
    "name_en": "Yasothon",
  },
  {
    "id": 25,
    "name_th": "ชัยภูมิ",
    "name_en": "Chaiyaphum",
  },
  {
    "id": 26,
    "name_th": "อำนาจเจริญ",
    "name_en": "Amnat Charoen",
  },
  {
    "id": 27,
    "name_th": "หนองบัวลำภู",
    "name_en": "Nong Bua Lam Phu",
  },
  {
    "id": 28,
    "name_th": "ขอนแก่น",
    "name_en": "Khon Kaen",
  },
  {
    "id": 29,
    "name_th": "อุดรธานี",
    "name_en": "Udon Thani",
  },
  {
    "id": 30,
    "name_th": "เลย",
    "name_en": "Loei",
  },
  {
    "id": 31,
    "name_th": "หนองคาย",
    "name_en": "Nong Khai",
  },
  {
    "id": 32,
    "name_th": "มหาสารคาม",
    "name_en": "Maha Sarakham",
  },
  {
    "id": 33,
    "name_th": "ร้อยเอ็ด",
    "name_en": "Roi Et",
  },
  {
    "id": 34,
    "name_th": "กาฬสินธุ์",
    "name_en": "Kalasin",
  },
  {
    "id": 35,
    "name_th": "สกลนคร",
    "name_en": "Sakon Nakhon",
  },
  {
    "id": 36,
    "name_th": "นครพนม",
    "name_en": "Nakhon Phanom",
  },
  {
    "id": 37,
    "name_th": "มุกดาหาร",
    "name_en": "Mukdahan",
  },
  {
    "id": 38,
    "name_th": "เชียงใหม่",
    "name_en": "Chiang Mai",
  },
  {
    "id": 39,
    "name_th": "ลำพูน",
    "name_en": "Lamphun",
  },
  {
    "id": 40,
    "name_th": "ลำปาง",
    "name_en": "Lampang",
  },
  {
    "id": 41,
    "name_th": "อุตรดิตถ์",
    "name_en": "Uttaradit",
  },
  {
    "id": 42,
    "name_th": "แพร่",
    "name_en": "Phrae",
  },
  {
    "id": 43,
    "name_th": "น่าน",
    "name_en": "Nan",
  },
  {
    "id": 44,
    "name_th": "พะเยา",
    "name_en": "Phayao",
  },
  {
    "id": 45,
    "name_th": "เชียงราย",
    "name_en": "Chiang Rai",
  },
  {
    "id": 46,
    "name_th": "แม่ฮ่องสอน",
    "name_en": "Mae Hong Son",
  },
  {
    "id": 47,
    "name_th": "นครสวรรค์",
    "name_en": "Nakhon Sawan",
  },
  {
    "id": 48,
    "name_th": "อุทัยธานี",
    "name_en": "Uthai Thani",
  },
  {
    "id": 49,
    "name_th": "กำแพงเพชร",
    "name_en": "Kamphaeng Phet",
  },
  {
    "id": 50,
    "name_th": "ตาก",
    "name_en": "Tak",
  },
  {
    "id": 51,
    "name_th": "สุโขทัย",
    "name_en": "Sukhothai",
  },
  {
    "id": 52,
    "name_th": "พิษณุโลก",
    "name_en": "Phitsanulok",
  },
  {
    "id": 53,
    "name_th": "พิจิตร",
    "name_en": "Phichit",
  },
  {
    "id": 54,
    "name_th": "เพชรบูรณ์",
    "name_en": "Phetchabun",
  },
  {
    "id": 55,
    "name_th": "ราชบุรี",
    "name_en": "Ratchaburi",
  },
  {
    "id": 56,
    "name_th": "กาญจนบุรี",
    "name_en": "Kanchanaburi",
  },
  {
    "id": 57,
    "name_th": "สุพรรณบุรี",
    "name_en": "Suphan Buri",
  },
  {
    "id": 58,
    "name_th": "นครปฐม",
    "name_en": "Nakhon Pathom",
  },
  {
    "id": 59,
    "name_th": "สมุทรสาคร",
    "name_en": "Samut Sakhon",
  },
  {
    "id": 60,
    "name_th": "สมุทรสงคราม",
    "name_en": "Samut Songkhram",
  },
  {
    "id": 61,
    "name_th": "เพชรบุรี",
    "name_en": "Phetchaburi",
  },
  {
    "id": 62,
    "name_th": "ประจวบคีรีขันธ์",
    "name_en": "Prachuap Khiri Khan",
  },
  {
    "id": 63,
    "name_th": "นครศรีธรรมราช",
    "name_en": "Nakhon Si Thammarat",
  },
  {
    "id": 64,
    "name_th": "กระบี่",
    "name_en": "Krabi",
  },
  {
    "id": 65,
    "name_th": "พังงา",
    "name_en": "Phangnga",
  },
  {
    "id": 66,
    "name_th": "ภูเก็ต",
    "name_en": "Phuket",
  },
  {
    "id": 67,
    "name_th": "สุราษฎร์ธานี",
    "name_en": "Surat Thani",
  },
  {
    "id": 68,
    "name_th": "ระนอง",
    "name_en": "Ranong",
  },
  {
    "id": 69,
    "name_th": "ชุมพร",
    "name_en": "Chumphon",
  },
  {
    "id": 70,
    "name_th": "สงขลา",
    "name_en": "Songkhla",
  },
  {
    "id": 71,
    "name_th": "สตูล",
    "name_en": "Satun",
  },
  {
    "id": 72,
    "name_th": "ตรัง",
    "name_en": "Trang",
  },
  {
    "id": 73,
    "name_th": "พัทลุง",
    "name_en": "Phatthalung",
  },
  {
    "id": 74,
    "name_th": "ปัตตานี",
    "name_en": "Pattani",
  },
  {
    "id": 75,
    "name_th": "ยะลา",
    "name_en": "Yala",
  },
  {
    "id": 76,
    "name_th": "นราธิวาส",
    "name_en": "Narathiwat",
  },
  {
    "id": 77,
    "name_th": "บึงกาฬ",
    "name_en": "buogkan",
  }
].map((e) => Province.fromJson(e)).toList();

List<String> mountList = [
  "มกราคม",
  "กุมภาพันธ์",
  "มีนาคม",
  "เมษายน",
  "พฤษภาคม",
  "มิถุนายน",
  "กรกฎาคม",
  "สิงหาคม",
  "กันยายน",
  "ตุลาคม",
  "พฤศจิกายน",
  "ธันวาคม",
];

List<String> mountAbbreviation = [
  "ม.ค.",
  "ก.พ.",
  "มี.ค.",
  "เม.ย.",
  "พ.ค.",
  "มิ.ย.",
  "ก.ค.",
  "ส.ค.",
  "ก.ย.",
  "ต.ค.",
  "พ.ย.",
  "ธ.ค.",
];

class Province {
  int? id;
  String? nameTh;
  String? nameEn;

  Province({this.id, this.nameTh, this.nameEn});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameTh = json['name_th'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_th'] = this.nameTh;
    data['name_en'] = this.nameEn;
    return data;
  }
}
