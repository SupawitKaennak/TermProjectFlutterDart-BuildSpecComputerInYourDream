import '../models/models.dart';

class PartsRepository {
  // NOTE: Sample realistic-like data; replace with API/CSV later.
  List<Part> partsFor(PartCategory category) {
    switch (category) {
      case PartCategory.cpu:
        return [
          Part(
            id: 'cpu-ryzen3-1200',
            name: 'AMD Ryzen 3 1200',
            price: 2740,
            category: PartCategory.cpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/20180731172019_26634_24_1.png',
            description: '4C/4T • Base 3.1 GHz Turbo 3.4 GHz • AM4 • 65W',
          ),
          Part(
            id: 'cpu-ryzen5-5600',
            name: 'AMD Ryzen 5 5600',
            price: 3990,
            category: PartCategory.cpu,
            imageUrl: 'https://ihcupload.s3.ap-southeast-1.amazonaws.com/img/product/product736_800.jpg',
            description: '6C/12T • Base 3.5GHz Boost 4.4GHz • AM4 • 65W',
          ),
          Part(
            id: 'cpu-ryzen7-5700g',
            name: 'AMD Ryzen 7 5700G',
            price: 5990,
            category: PartCategory.cpu,
            imageUrl: 'https://media-cdn.bnn.in.th/129511/amd-cpu-ryzen-7-5700g-gen5-1.jpg',
            description: '8C/16T • Base 3.8GHz Boost 4.6GHz • AM4 • 65W',
          ),
          Part(
            id: 'cpu-ryzen9-5950x',
            name: 'AMD Ryzen 9 5950X',
            price: 13019,
            category: PartCategory.cpu,
            imageUrl: 'https://m.media-amazon.com/images/I/61ISSSA+x+L._AC_SL1280_.jpg',
            description: '16C/32T • Base 3.4GHz Boost 4.9GHz • AM4 • 105W',
          ),
          Part(
            id: 'cpu-i3-12100',
            name: 'INTEL CORE I3-12100',
            price: 3590,
            category: PartCategory.cpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2022021010031651545_1.jpg',
            description: '4C/8T • Base 3.3GHz Turbo 4.3GHz • LGA1700 • 60W',
          ),
          Part(
            id: 'cpu-i5-12400F',
            name: 'Intel Core i5-12400F',
            price: 4600,
            category: PartCategory.cpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2022010509243450623_1.jpg',
            description: '6C/12T • Base 2.5GHz Turbo 4.4GHz • LGA1700 • 65W',
          ),
          Part(
            id: 'cpu-i7-14700f',
            name: 'INTEL 1700 CORE I7-14700F',
            price: 9990,
            category: PartCategory.cpu,
            imageUrl: 'https://ihcupload.s3.ap-southeast-1.amazonaws.com/img/product/products123934_800.jpg',
            description: '20C/28T • Base 2.4GHz Turbo 5.4GHz • LGA1700 • 65W • Max power 219W',
          ),           
          Part(
            id: 'cpu-i9-14900k',
            name: 'INTEL CORE I9-14900K',
            price: 16900,
            category: PartCategory.cpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2023101615262063040_1.png',
            description: '24C/32T • Base 3.2GHz Turbo 6GHz • LGA1700 • 125W',
          ),
        ];
      case PartCategory.mainboard:
        return [
          Part(
            id: 'mb-b550m',
            name: 'ASUS TUF Gaming B550M-PLUS',
            price: 3990,
            category: PartCategory.mainboard,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2021011616214344826_1.jpg',
            description: 'AM4 • mATX • PCIe 4.0 • 2x M.2 • 4x DIMM',
          ),
          Part(
            id: 'mb-h610m k',
            name: 'MSI PRO B660M-A DDR4',
            price: 3490,
            category: PartCategory.mainboard,
            imageUrl: 'https://ihcupload.s3.ap-southeast-1.amazonaws.com/img/product/products40588_800.jpg',
            description: 'LGA1700 • mATX • PCIe 4.0 • 2x M.2 • DDR4',
          ),
          Part(
            id: 'mb-b660m',
            name: 'GIGABYTE H610M K DDR4',
            price: 1790,
            category: PartCategory.mainboard,
            imageUrl: 'https://asset.msi.com/resize/image/global/product/product_16450616495843a011b65cafb5c31b1d8f280ccff0.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png',
            description: 'LGA1700 • mATX • PCIe 4.0 • 1x M.2 • DDR4',
          ),
          Part(
            id: 'mb-b450m-steel-legend',
            name: 'ASROCK B450M STEEL LEGEND (AMD SOCKET AM4 DDR4 MICRO-ATX)',
            price: 2790,
            category: PartCategory.mainboard,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2019030214235233132_1.png',
            description: 'AM4 • mATX • PCIe 4.0 • 2x M.2 • DDR4',
          ),
          Part(
            id: 'mb-gigabyte-b550m-ds3h',
            name: 'GIGABYTE B550M DS3H (REV. 1.7) (DDR4) (SOCKET AM4) (MICRO-ATX)',
            price: 2990,
            category: PartCategory.mainboard,
            imageUrl: 'https://img.advice.co.th/images_nas/pic_product4/A0153455/A0153455OK_BIG_1.jpg',
            description: 'AM4 • mATX • PCIe 4.0 • 2x M.2, 1 x nvmg, 1 x sata • DDR4 x 4 slots',
          ),
          Part(
            id: 'mb-msi-z690-a-ddr4',
            name: 'MSI PRO Z690-A DDR4',
            price: 7490,
            category: PartCategory.mainboard,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2021110315094049602_1.jpg',
            description: 'LGA1700 • ATX • PCIe 4.0 • 2x M.2, 1 x nvmg, 1 x sata • DDR4 x 4 slots',
          ),
        ];
      case PartCategory.gpu:
        return [
          Part(
            id: 'gpu-rtx-4060',
            name: 'GIGABYTE NVIDIA GeForce RTX 4060 8GB',
            price: 11990,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2023062813215960498_1.jpg',
            description: 'Ada Lovelace • 8GB GDDR6 • HDMI/DP • pcie 4.0', 
          ),
          Part(
            id: 'gpu-gtx-1650',
            name: 'ASUS TUF GTX1650 O4GD6 P GAMING 4GB',
            price: 5790,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2020081810102142200_1.jpg',
            description: 'TURING • 4GB GDDR5 • HDMI/DP • pcie 3.0',
          ),
          Part(
            id: 'gpu-rx-6600',
            name: 'ASRock Radeon RX 6600 8GB',
            price: 7990,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2021111013092349709_1.jpg',
            description: 'RDNA2 • 8GB GDDR6 • HDMI/DP • pcie 4.0',
          ),
          Part(
            id: 'gpu-sapphire-pulse-rx-7600xt',
            name: 'SAPPHIRE PULSE AMD RADEON RX 7600 XT 16GB - 16GB GDDR6',
            price: 12500,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2024031214163066032_1.jpg',
            description: 'RDNA3 • 16GB GDDR6 • HDMI/DP • pcie 4.0',
          ),
          Part(
            id: 'gpu-asus-rog-astral-rtx-5090',
            name: 'ASUS ROG ASTRAL GEFORCE RTX 5090 32GB GDDR7 OC EDITION',
            price: 114900,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2025013014142074055_1.jpg',
            description: 'Blackwell • 32GB GDDR7 • HDMI/DP • pcie 5.0',
          ),
          Part(
            id: 'gpu-msi-geforce-gt-1030-2gd4-lp-oc',
            name: 'MSI GEFORCE GT 1030 2GD4 LP OC - 2GB DDR4',
            price: 2460,
            category: PartCategory.gpu,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2021063015175947445_1.jpg',
            description: 'NVIDIA Pascal • 2GB GDDR4 • HDMI/DP • pcie 3.0',
          ),
        ];
      case PartCategory.memory:
        return [
          Part(
            id: 'ram-corsair-16-ddr4-3200',
            name: 'Corsair Vengeance LPX 16GB (2x8) DDR4-3200',
            price: 1590,
            category: PartCategory.memory,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2021033008460146060_1.jpg',
            description: 'DDR4 • 3200MHz • CL16 • 1.35V',
          ),
          Part(
            id: 'ram-gskill-32-ddr4-3600',
            name: 'G.SKILL Ripjaws V 32GB (2x16) DDR4-3600',
            price: 2690,
            category: PartCategory.memory,
            imageUrl: 'https://www.gskill.com/_upload/images/156283178410.png',
            description: 'DDR4 • 3600MHz • CL18',
          ),
          Part(
            id: 'ram-kingston-32-ddr4-3600',
            name: 'KINGSTON FURY BEAST RGB RAM DDR4(3200) 32GB (16GBX2)',
            price: 2640,
            category: PartCategory.memory,
            imageUrl: 'https://img.advice.co.th/images_nas/pic_product4/A0155760/A0155760OK_BIG_1.jpg',
            description: 'DDR4 • 3200MHz • CL16',
          ),
        ];
      case PartCategory.m2:
        return [
          Part(
            id: 'ssd-samsung-1tb',
            name: 'Samsung 970 EVO Plus 1TB NVMe',
            price: 2990,
            category: PartCategory.m2,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2019052214582033879_1.png',
            description: 'NVMe PCIe 3.0 x4 • Up to 3500/3300 MB/s',
          ), 
          Part(
            id: 'ssd-wd-blue-1tb',
            name: '500 GB SSD WD BLUE SATA M.2 2280 (WDS500G2B0B) 3D NAND',
            price: 1590,
            category: PartCategory.m2,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/20180719141003_27814_21_1.jpg',
            description: 'sata 3.0 6Gb/s • Up to 530/560 MB/s',
          ),          
        ];
      case PartCategory.storage:
        return [
          Part(
            id: 'hdd-seagate-barracuda-2tb',
            name: 'SEAGATE BARRACUDA - 7200RPM SATA3 2TB 3.5 INCH HDD"',
            price: 1850,
            category: PartCategory.storage,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/20180720094719_23214_21_1.jpg',
            description: 'SATA 3.0 6Gb/s',
          ),
          Part(
            id: 'ssd-crucial-sata-1tb',
            name: 'Crucial MX500 1TB 2.5"',
            price: 2390,
            category: PartCategory.storage,
            imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/61qpwctb5uL.jpg',
            description: 'SATA 6Gb/s • Up to 560/510 MB/s',
          ),
           Part(
            id: 'hdd-wd-blue-sata-1tb',
            name: '1 TB HDD WD BLUE (7200RPM, 64MB, SATA-3, WD10EZEX)"',
            price: 1595,
            category: PartCategory.storage,
            imageUrl: 'https://img.advice.co.th/images_nas/pic_product4/A0061974/A0061974OK_BIG_1.jpg',
            description: 'SATA 6Gb/s',
          ),
        ];
      case PartCategory.casePc:
        return [
          Part(
            id: 'case-nr200p',
            name: 'Cooler Master NR200P (mITX)',
            price: 3290,
            category: PartCategory.casePc,
            imageUrl: 'https://www.autonetpc.com/wp-content/uploads/2024/06/imageedit_3_4650120420.png',
            description: 'Mini-ITX • Tempered Glass • 2x 120mm fans',
          ),
          Part(
            id: 'case-meshify-c',
            name: 'Fractal Design Meshify C',
            price: 3490,
            category: PartCategory.casePc,
            imageUrl: 'https://www.fractal-design.com/app/uploads/2019/06/Meshify-C_1.jpg',
            description: 'ATX • High airflow mesh front',
          ),
          Part(
            id: 'case-hyte-y70-snow-white',
            name: 'CASE (เคส) HYTE Y70 (SNOW-WHITE) (E-ATX)',
            price: 7490,
            category: PartCategory.casePc,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2024051010123667183_1.jpg',
            description: 'ATX • Steel, Tempered Glass • 3x 120mm fans',
          ),
        ];
      case PartCategory.psu:
        return [
          Part(
            id: 'psu-650w-bronze',
            name: 'Corsair CV650 650W 80+ Bronze',
            price: 1790,
            category: PartCategory.psu,
            imageUrl: 'https://microless.com/cdn/products/bea3f9ddbf8ee10f1809ab7b3ae9e05d-hi.jpg',
            description: '650W • 80+ Bronze • Non-modular',
          ),
          Part(
            id: 'psu-750w-gold',
            name: 'Seasonic Focus GX-750 80+ Gold',
            price: 3990,
            category: PartCategory.psu,
            imageUrl: 'https://m.media-amazon.com/images/I/41zLhprxqXL.jpg',
            description: '750W • Fully Modular • 80+ Gold',
          ),
          Part(
            id: 'psu-1200w-gold',
            name: 'THERMALTAKE TOUGHPOWER GF A3 1200W 80 PLUS GOLD BLACK ATX',
            price: 7590,
            category: PartCategory.psu,
            imageUrl: 'https://www.jib.co.th/img_master/uploads/0_Content/2023/202308/2314534130/100-03.jpg',
            description: '1200W • Fully Modular • 80+ Gold',
          ),
        ];
      case PartCategory.cpuCooler:
        return [
          Part(
            id: 'cooler-212',
            name: 'Cooler Master Hyper 212 Black Edition',
            price: 1290,
            category: PartCategory.cpuCooler,
            imageUrl: 'https://a.storyblok.com/f/281110/1500x1500/1386b0725a/hyper-212-black-00-overview.png',
            description: 'Tower Air Cooler • 120mm Fan',
          ),
          Part(
            id: 'cooler-pro-3-black',
            name: 'BE QUIET PURE ROCK PRO 3 - BLACK',
            price: 1690,
            category: PartCategory.cpuCooler,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2025043015152276328_1.jpg',
            description: 'Tower Air Cooler • 120mm Fan socket LGA1700, AM4, AM5',
          ),
          Part(
            id: 'cooler-ocypus-delta-a62-argb-white',
            name: 'OCYPUS DELTA A62 ARGB - WHITE',
            price: 1690,
            category: PartCategory.cpuCooler,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2025080516493979181_1.jpg',
            description: 'Tower Air Cooler • 120mm Fan socket LGA1700, AM4, AM5',
          ),
        ];
      case PartCategory.monitor:
        return [
          Part(
            id: 'mon-24-ips-144',
            name: 'AOC 24G2 24" IPS 144Hz',
            price: 3990,
            category: PartCategory.monitor,
            imageUrl: 'https://m.media-amazon.com/images/I/81J4utZ5bnL.jpg',
            description: '24" IPS • 1920x1080 • 144Hz • FreeSync',
          ),
          Part(
            id: 'mon-27-2k-165',
            name: 'Gigabyte M27Q 27" QHD 165Hz',
            price: 8990,
            category: PartCategory.monitor,
            imageUrl: 'https://m.media-amazon.com/images/I/71Wg4PqSFTL.jpg',
            description: '27" IPS • 2560x1440 • 165Hz',
          ),
          Part(
            id: 'mon-34-2k-100',
            name: 'Monitor 34 LG UltraWide 34WR50QK-B (VA, HDMI, DP) CURVE 2K 100Hz',
            price: 7190,
            category: PartCategory.monitor,
            imageUrl: 'https://img.advice.co.th/images_nas/pic_product4/A0167965/A0167965OK_BIG_1.jpg',
            description: '34" VA • 2560x1440 • 100Hz',
          ),
        ];
      case PartCategory.keyboard:
        return [
          Part(
            id: 'kb-gk61',
            name: 'Royal Kludge RK61 Wireless (white)',
            price: 1490,
            category: PartCategory.keyboard,
            imageUrl: 'https://www.gump.in.th/uploaded_files/images/RKKKKKKKKKKKKKKKKKKKKKK/RK%20Royal%20-%2001.jpg',
            description: '60% • Wireless/Bluetooth • Hot-swap',
          ),
          Part(
            id: 'kb-k68',
            name: 'Corsair K68 RGB',
            price: 2590,
            category: PartCategory.keyboard,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/20180822103120_28753_24_1.png',
            description: 'Full-size • RGB • Dust & Spill Resistant',
          ),
          Part(
            id: 'kb-ak980',
            name: 'AJAZZ AK980 RED SWITCH RAINBOW LED EN/TH - RETRO CLASSIC',
            price: 2590,
            category: PartCategory.keyboard,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2025061714040677686_1.jpg',
            description: '98% size • RGB • gasket mount design',
          ),
        ];
      case PartCategory.mouse:
        return [
          Part(
            id: 'mouse-g102',
            name: 'Logitech G102 Lightsync (black)',
            price: 490,
            category: PartCategory.mouse,
            imageUrl: 'https://www.jib.co.th/img_master/product/original/2020060413231839950_1.jpg',
            description: '8000 DPI • RGB • 6 Buttons',
          ),
          Part(
            id: 'mouse-viper-mini',
            name: 'Razer Viper Mini',
            price: 890,
            category: PartCategory.mouse,
            imageUrl: 'https://manuals.plus/wp-content/uploads/2021/04/razer-viper-mini.png',
            description: '8500 DPI • Lightweight 61g',
          ),
           Part(
            id: 'mouse-logi-g304',
            name: 'LOGITECH G304 LIGHTSPEED WIRELESS (WHITE)',
            price: 1390,
            category: PartCategory.mouse,
            imageUrl: 'https://ihcupload.s3.ap-southeast-1.amazonaws.com/img/product/product3192_800.jpg',
            description: '12000 DPI • Lightweight 69g • Wireless 2.4GHz battery 250hrs',
          ),
        ];
    }
  }
}


