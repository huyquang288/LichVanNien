var numberOfHearts= [1,4,2,3,2,5,1,4,1,2,1,4,2,3,5,2,1,4,2,3,5,4,2,1,5,5,4,1,1,2,1,3];
var lucky= 11;
var money= 8;
var work= 21;
var love= 29;
var emotion= 17;

var date= (new Date()).getDate();

function getIndex(numberOfZodiac) {
    workHeartsSource= "/images/hearts/" +numberOfHearts[(work* date + numberOfZodiac)%31] +".png"
    loveHeartsSource= "/images/hearts/" +numberOfHearts[(love* date + numberOfZodiac)%31] +".png"
    emotionHeartsSource= "/images/hearts/" +numberOfHearts[(emotion* date + numberOfZodiac)%31] +".png"
    luckyHeartsSource= "/images/hearts/" +numberOfHearts[(lucky* date + numberOfZodiac)%31] +".png"
    moneyHeartsSource= "/images/hearts/" +numberOfHearts[(money* date + numberOfZodiac)%31] +".png"

    switch (numberOfZodiac) {
        case aquariusNumber: {
            zodiacIconSource= "/images/zodiacs/aquarius.png";
            focusZodiacName= "BẢO BÌNH"
            dayOfZodiac= "20/1→18/2"
            text1="Cung Bảo Bình được Thiên Vương Tinh bảo hộ, tượng trưng cho thần bầu trời Uranus."
            text2= "Ngày hôm nay của Bảo Bình  {｡^◕‿◔^｡}"
            return;
        }
        case piscesNumber: {
            zodiacIconSource= "/images/zodiacs/pisces.png";
            focusZodiacName= "SONG NGƯ"
            dayOfZodiac= "19/2→20/3"
            text1="Cung Song Ngư được Hải Vương Tinh bảo hộ, tượng trưng cho thần biển Neptune (Poseidon)."
            text2= "Ngày hôm nay của Song Ngư  {｡^◕‿◔^｡}"
            return;
        }
        case ariesNumber: {
            zodiacIconSource= "/images/zodiacs/aries.png";
            focusZodiacName= "BẠCH DƯƠNG"
            dayOfZodiac= "21/3→19/4"
            text1="Cung Bạch Dương được Hỏa Tinh bảo hộ, tượng trưng cho thần chiến tranh Mars trong thần thoại La Mã (Ares của thần thoại Hi Lạp)."
            text2= "Ngày hôm nay của Bạch Dương  {｡^◕‿◔^｡}"
            return;
        }
        case taurusNumber: {
            zodiacIconSource= "/images/zodiacs/taurus.png";
            focusZodiacName= "KIM NGƯU"
            dayOfZodiac= "20/4→20/5"
            text1="Cung Kim Ngưu được Kim Tinh bảo hộ, tượng trưng cho nữ thần Venus (Aphrodite của thần thoại Hi Lạp.)"
            text2= "Ngày hôm nay của Kim Ngưu  {｡^◕‿◔^｡}"
            return;
        }
        case geminiNumber: {
            zodiacIconSource= "/images/zodiacs/gemini.png";
            focusZodiacName= "SONG TỬ"
            dayOfZodiac= "21/5→21/6"
            text1="Cung Song Tử được Thủy Tinh bảo hộ, tượng trưng cho thần đưa tin Mercury (Hermes)."
            text2= "Ngày hôm nay của Song Tử  {｡^◕‿◔^｡}"
            return;
        }
        case cancerNumber: {
            zodiacIconSource= "/images/zodiacs/cancer.png";
            focusZodiacName= "CỰ GIẢI"
            dayOfZodiac= "22/6→22/7"
            text1="Cung Cự Giải được Mặt Trăng bảo hộ, tượng trưng cho nữ thần hôn nhân gia đình Junon (Hera trong thần thoại Hi Lạp)"
            text2= "Ngày hôm nay của Cự Giải  {｡^◕‿◔^｡}"
            return;
        }
        case leoNumber: {
            zodiacIconSource= "/images/zodiacs/leo.png";
            focusZodiacName= "SƯ TỬ"
            dayOfZodiac= "23/7→22/8"
            text1="Cung Sư Tử được Mặt Trời bảo hộ, tượng trưng cho thần mặt trời Helios."
            text2= "Ngày hôm nay của Sư Tử  {｡^◕‿◔^｡}"
            return;
        }
        case virgoNumber: {
            zodiacIconSource= "/images/zodiacs/virgo.png";
            focusZodiacName= "XỬ NỮ"
            dayOfZodiac= "23/8→22/9"
            text1="Cung Xử Nữ được Thủy Tinh bảo hộ, tượng trưng cho trí tuệ, lòng chung thủy, cầu toàn nguyên tắc. (Demeter)"
            text2= "Ngày hôm nay của Xử Nữ  {｡^◕‿◔^｡}"
            return;
        }
        case libraNumber: {
            zodiacIconSource= "/images/zodiacs/libra.png";
            focusZodiacName= "THIÊN BÌNH"
            dayOfZodiac= "23/9→23/10"
            text1="Cung Thiên Bình được Kim Tinh bảo hộ, cung này biểu tượng cho sắc đẹp, sự quyến rũ, công bằng. Tượng trưng cho nữ thần Venus."
            text2= "Ngày hôm nay của Thiên Bình  {｡^◕‿◔^｡}"
            return;
        }
        case scorpioNumber: {
            zodiacIconSource= "/images/zodiacs/scorpio.png";
            focusZodiacName= "BỌ CẠP"
            dayOfZodiac= "24/10→22/11"
            text1="Cung Hổ Cáp Diêm Vương Tinh bảo hộ, tượng trưng cho Pluto (Hades), thần cai quan âm phủ."
            text2= "Ngày hôm nay của Hổ Cáp  {｡^◕‿◔^｡}"
            return;
        }
        case sagittariousNumber: {
            zodiacIconSource= "/images/zodiacs/sagittarious.png";
            focusZodiacName= "NHÂN MÃ"
            dayOfZodiac= "23/11→21/12"
            text1="Cung Nhân Mã được Mộc Tinh bảo hộ, tượng trưng cho thần sấm sét Jupiter (Zeus)."
            text2= "Ngày hôm nay của Nhân Mã  {｡^◕‿◔^｡}"
            return;
        }
        case capricornNumber: {
            zodiacIconSource= "/images/zodiacs/capricorn.png";
            focusZodiacName= "MA KẾT"
            dayOfZodiac= "22/12→19/1"
            text1="Cung Ma Kết được Thổ Tinh bảo hộ, tượng trưng cho thần bầu trời Saturn (Cronos)."
            text2= "Ngày hôm nay của Ma Kết  {｡^◕‿◔^｡}"
            return;
        }
        default: return;
    }


}

