import 'package:feedback_capture/models/product.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  late List<Product> productTypes = [];

  getProducts() {
    productTypes = [
      Product(
        "ATTA",
        "SUGAR CONTROL",
        "Aashirvaad Sugar Control Atta 5 kg",
      ),
      Product(
        "ATTA",
        "SUGAR CONTROL",
        "Aashirvaad Sugar Control Atta 1 kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 10 Kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 10 Kg+ 50G Chilli free",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 1 Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "Aashirvaad Multigrain Atta 5 Kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 5 Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "Aashirvaad Multigrain Atta 1 Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "AashirvaadMG Atta 5Kg + Cloth free",
      ),
      Product(
        "ATTA",
        "SELECT WHEAT",
        "Aashirvaad Select Atta 5 Kg + Roti Cover",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 05 Kg",
      ),
      Product(
        "ATTA",
        "SELECT WHEAT",
        "Aashirvaad Select Atta 2 Kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 500g",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 2 Kg",
      ),
      Product(
        "ATTA",
        "SELECT WHEAT",
        "Aashirvaad Select Atta 5 Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "Aashirvaad Multigrain Atta 500g",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Fortified Atta10 Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "Aashirvaad Multigrain Atta 10Kg",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Organic Atta 5Kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 10kg+Hunar Promo",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Gluten Free Atta 500g",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Multi Millet Atta 500g",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Multi Millet Atta 1 kg",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Ragi Atta 1 kg",
      ),
      Product(
        "ATTA",
        "SELECT WHEAT",
        "Aashirvaad Select Atta 1 Kg",
      ),
      Product(
        "ATTA",
        "SELECT WHEAT",
        "Aashirvaad Select Atta 10 Kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 10kg+1KG  AT free",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Organic Atta 1 Kg",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Gluten Free Atta 1 kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 5 Kg+ Vermicelli free",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 1kg+Tumeric free",
      ),
      Product(
        "ATTA",
        "NATURES SUPER FOODS",
        "Aashirvaad Ragi Atta 500g",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 1Kg+ 20G Chilli free",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 10Kg",
      ),
      Product(
        "ATTA",
        "WHEAT WITH MG",
        "Aashirvaad Multigrain Atta 10 kg",
      ),
      Product(
        "ATTA",
        "WHOLE WHEAT",
        "Aashirvaad Atta 5 Kg+ Salt free",
      ),
      Product(
        "JUICES",
        "Juice 100%",
        "B Natural Pomegranate 100% 1 Ltr",
      ),
      Product(
        "JUICES",
        "NAGPURI SANTRA",
        "B Natural PET Orange 750ml",
      ),
      Product(
        "JUICES",
        "NAGPURI SANTRA",
        "B Natural PET Orange 300ml",
      ),
      Product(
        "JUICES",
        "LITCHI",
        "B Natural Litchi 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "ORANGE",
        "B Natural Orange Plus 1 Ltr",
      ),
      Product(
        "JUICES",
        "APPLE",
        "B Natural Apple 1 Ltr",
      ),
      Product(
        "JUICES",
        "GUAVA",
        "B Natural Guava 1 Ltr",
      ),
      Product(
        "JUICES",
        "MANGO",
        "B Natural Mango 1 Ltr",
      ),
      Product(
        "JUICES",
        "LITCHI",
        "B Natural Litchi 1 Ltr",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Mixed Fruit 1 Ltr",
      ),
      Product(
        "JUICES",
        "GUAVA",
        "B Natural Guava 125ml",
      ),
      Product(
        "JUICES",
        "MASALA JAMUN",
        "B Natural Jamun 2 Ltr",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Mixed Fruit 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "DARK FANTASY MILKSHAKE",
        "SUNFEAST Milkshake Chocolate Shake",
      ),
      Product(
        "JUICES",
        "SUNFEAST MILKSHAKE",
        "SUNFEAST NUTRILITEPROTEINSKCOF200ML",
      ),
      Product(
        "JUICES",
        "CRANBERRY",
        "B Natural Cranberry 1 Ltr",
      ),
      Product(
        "JUICES",
        "ORANGE",
        "B Natural Orange 180ml",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Immunity Utility Box 2X1L",
      ),
      Product(
        "JUICES",
        "SUNFEAST MILKSHAKE",
        "SUNFEAST Milkshake Mango",
      ),
      Product(
        "JUICES",
        "PINEAPPLE",
        "B Natural Pineapple 1 Ltr",
      ),
      Product(
        "JUICES",
        "MASALA JAMUN",
        "B Natural Jamun 1 Ltr",
      ),
      Product(
        "JUICES",
        "Juice 100%",
        "B Natural Hexagonal gift Pack",
      ),
      Product(
        "JUICES",
        "LITCHI",
        "B Natural Litchi 180ml",
      ),
      Product(
        "JUICES",
        "APPLE",
        "B Natural Apple 180ml",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Mixed Fruit 180ml",
      ),
      Product(
        "JUICES",
        "APPLE",
        "B Natural Apple 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "ORANGE",
        "B Natural Orange Plus 2 Ltr",
      ),
      Product(
        "JUICES",
        "PET ASSORT",
        "B Natural Gift Pack - Pack of Purity",
      ),
      Product(
        "JUICES",
        "MANGO",
        "B Natural Mango 125ml",
      ),
      Product(
        "JUICES",
        "PET ASSORT",
        "B Natural Gift Pack - Jute Bag",
      ),
      Product(
        "JUICES",
        "HIMALAYAN MIX FRUIT",
        "B Natural PET Mixfruit 300ml",
      ),
      Product(
        "JUICES",
        "POMEGRANATE",
        "B Natural Pomegranate 180ml",
      ),
      Product(
        "JUICES",
        "DAKSHIN PINK GUAVA",
        "B Natural PET Guava 300ml",
      ),
      Product(
        "JUICES",
        "DAKSHIN PINK GUAVA",
        "B Natural PET Guava 750ml",
      ),
      Product(
        "JUICES",
        "RATNAGIRI ALPHONSO",
        "B Natural PET Mango 750ml",
      ),
      Product(
        "JUICES",
        "APPLE BEETROOT CARROT",
        "B Natural ABC 300ml for Amway",
      ),
      Product(
        "JUICES",
        "RATNAGIRI ALPHONSO",
        "B Natural PET Mango 300ml",
      ),
      Product(
        "JUICES",
        "Juice 100%",
        "B Natural Kids Pack",
      ),
      Product(
        "JUICES",
        "POMEGRANATE",
        "B Natural Pomegranate plus2 Ltr",
      ),
      Product(
        "JUICES",
        "HIMALAYAN MIX FRUIT",
        "B Natural PET Mixfruit 750ml",
      ),
      Product(
        "JUICES",
        "Juice 100%",
        "B Natural Immunity Box  Gift Pack",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Mixed Fruit 2 Ltr",
      ),
      Product(
        "JUICES",
        "Juice 100%",
        "B Natural Suitcase Pack",
      ),
      Product(
        "JUICES",
        "PET ASSORT",
        "B Natural Origins Mini Pack",
      ),
      Product(
        "JUICES",
        "ORANGE",
        "B Natural Orange Fruit 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "MANGO",
        "B Natural Mango 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Diwali Gift Pack 1.125ml",
      ),
      Product(
        "JUICES",
        "GUAVA",
        "B Natural Guava 1 Ltr (Pack of 2)",
      ),
      Product(
        "JUICES",
        "GUAVA",
        "B Natural Guava 180ml",
      ),
      Product(
        "JUICES",
        "POMEGRANATE",
        "B Natural Pomegranate 1 Ltr",
      ),
      Product(
        "JUICES",
        "MIXED FRUIT",
        "B Natural Mixed Fruit 125ml",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 48+Tray EngFree",
      ),
      Product(
        "NOODLES",
        "SAUCY MASALA",
        "Saucy Masala large pack",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Eight Block",
      ),
      Product(
        "NOODLES",
        "MAX",
        "Max Masala Rs 5",
      ),
      Product(
        "NOODLES",
        "MOODS",
        "Mood Masala Rs 15",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 5",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 12",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 10",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 72",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Single Block",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 24",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala - Pack of 12",
      ),
      Product(
        "NOODLES",
        "POWER UP",
        "Yippee Power Up large pack",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 68",
      ),
      Product(
        "NOODLES",
        "POWER UP",
        "Yippee Power Up Rs 22",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 48",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 70 + Mood Masala Free",
      ),
      Product(
        "NOODLES",
        "SAUCY MASALA",
        "Yippee Saucy Masala Four Block",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 46+Cloth Free",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 70 + Saucy Free",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 70 + MASK Free",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 46+Tray EngFree",
      ),
      Product(
        "NOODLES",
        "MOODS",
        "Mood Masala large pack",
      ),
      Product(
        "NOODLES",
        "MAX",
        "Max Masala Rs 24",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 46",
      ),
      Product(
        "NOODLES",
        "POWER UP",
        "Yippee Power Up Rs 172",
      ),
      Product(
        "NOODLES",
        "POWER UP",
        "Yippee Power Up Rs 24",
      ),
      Product(
        "NOODLES",
        "MAX",
        "Max Masala Rs 12",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 70",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Rs 68 + Mood Masala Free",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Four Block",
      ),
      Product(
        "NOODLES",
        "SAUCY MASALA",
        "Yippee Saucy Masala Single Block",
      ),
      Product(
        "NOODLES",
        "SAUCY MASALA",
        "Saucy Masala Rs 15",
      ),
      Product(
        "NOODLES",
        "MAGIC",
        "Magic Masala Half Block",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 240",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 05",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Vanilla 80",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Slice Mxfrt 10",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light  05",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Choco 05",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Butterscotch 05",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 05",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Choco 05 NV",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 10",
      ),
      Product(
        "BISCUIT",
        "MP COOKIES",
        "HiFi Butter 05",
      ),
      Product(
        "BISCUIT",
        "MP COOKIES",
        "HiFi Cashew 05",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM STRAWBERRY VANILLA 10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM CHOCO VANILLA 10",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 30",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM STRAWBERRY VANILLA 05",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM ORANGE VANILLA 05",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM ORANGE VANILLA 10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "DOUBLE CREAM CHOCO VANILLA 05",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Butter 10",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 3",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 30",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 2",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Slice Choco 10",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Choco & Coffee Fills (3+1) 105",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 5 Seed 25",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 15",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Choco 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Nuts Biscotti 30",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Choco 05",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Elaichi 05",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Milk 05",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Orange 05",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Milk 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 99",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 105",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 20",
      ),
      Product(
        "BISCUIT",
        "A2 MILK",
        "Milk Biscuits 10",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Assorted 360",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Raisins 60",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Almonds 60",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Elaichi 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Butter 30",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 30",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Choco 10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Strawberry 20",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Assorted 300",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Raisins 50",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Choco 50",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Nutfills 30",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Veda 20",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER CREAM&HERB 10",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER CREAM&HERB 25 NSW",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Swiss Roll Choco 10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Choco 20",
      ),
      Product(
        "BISCUIT",
        "YUMFILLS",
        "Yumfills  180",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Pineapple 05",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Veda  55",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Orange10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Double Cream Orange 10",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Choco 80",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF BIG Fills 60",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Butter 05",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 35",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Nutfills 75",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 35",
      ),
      Product(
        "BISCUIT",
        "NICE",
        "Nice 10",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Nutfills 40",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 30",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Veda  60 Promo",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Nuts 70 Promo",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 25",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Vanilla 30",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 35",
      ),
      Product(
        "BISCUIT",
        "YUMFILLS",
        "Yumfills  80",
      ),
      Product(
        "BISCUIT",
        "VEDA MARIE",
        "Veda Marie 30",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Slice Mxfrt 30",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 40",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Nuts 25",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Trinity Choco 120",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Nuts 60",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Nutfills 35+BB Free",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "SF Glucose Plus  01KG",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 150",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 300",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 20",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 80",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 35",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Fruit Milk 10",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Butterscotch 05 NV",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Butterscotch 10",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 22",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Choco 60",
      ),
      Product(
        "BISCUIT",
        "DF CHOCO CHIP",
        "DF Chocochip 100",
      ),
      Product(
        "BISCUIT",
        "DF CHOCO CHIP",
        "DF Chocochip 10",
      ),
      Product(
        "BISCUIT",
        "DF CHOCO CHIP",
        "DF Chocochip 30",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Vanilla 75",
      ),
      Product(
        "BISCUIT",
        "VEDA MARIE",
        "Veda Marie 10",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 5",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 18",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 72",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER POTATO MASALA 25 NSW",
      ),
      Product(
        "BISCUIT",
        "VEDA MARIE",
        "Veda Marie 35",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 32",
      ),
      Product(
        "BISCUIT",
        "BOUNCE FILLS",
        "Bounce Fills Orange Vanilla 05",
      ),
      Product(
        "BISCUIT",
        "BOUNCE FILLS",
        "Bounce Fills Choco Creme 05",
      ),
      Product(
        "BISCUIT",
        "BOUNCE FILLS",
        "Bounce Fills Strb Vanilla 05",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 120",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 5 Grain 1Kg 200",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF VANILLA FILLS 20",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF VANILLA FILLS 10",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Trinity Choco 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Chocochip 50",
      ),
      Product(
        "BISCUIT",
        "DF DESSERTS",
        "DF Choco Chunks 75G",
      ),
      Product(
        "BISCUIT",
        "DF DESSERTS",
        "DF Choco Nut Dipped 100G",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF BIG Fills 70",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Veda  60",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 5 Seed 70",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Butterscotch 20",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Butterscotch 10",
      ),
      Product(
        "BISCUIT",
        "BOUNCE DREAM CREAM",
        "Dream Cream Strawberry 10",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Fruit Milk 40",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Butter 20",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Choco 75",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 280",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 140",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Coffeefills 35",
      ),
      Product(
        "BISCUIT",
        "MA OATS",
        "Oats Marie 10",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Mixed 300",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Pineapple 10",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 05",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 1Kg 120",
      ),
      Product(
        "BISCUIT",
        "MA OATS",
        "Oats Marie 25",
      ),
      Product(
        "BISCUIT",
        "MA ORANGE",
        "Orange Marie 15",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive Nuts 70",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 60",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Choco 50",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER POTATO MASALA 20",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Choco & Coffee Fills (3+1) 90",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER POTATO MASALA 10",
      ),
      Product(
        "BISCUIT",
        "MA ORANGE",
        "Orange Marie 10",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills 10",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Nutfills 35",
      ),
      Product(
        "BISCUIT",
        "A2 MILK",
        "Milk Biscuits 05",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 10",
      ),
      Product(
        "BISCUIT",
        "MILK",
        "Milk Biscuits 05",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Chocofills Dispenser 05",
      ),
      Product(
        "BISCUIT",
        "NICE",
        "Nice 25",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF Coffeefills 30",
      ),
      Product(
        "BISCUIT",
        "YUMFILLS",
        "Yumfills  60",
      ),
      Product(
        "BISCUIT",
        "YUMFILLS",
        "Yumfills  120",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Cashew 25",
      ),
      Product(
        "BISCUIT",
        "DARK FANTASY",
        "DF Gift 250",
      ),
      Product(
        "BISCUIT",
        "DARK FANTASY",
        "DF Gift 200",
      ),
      Product(
        "BISCUIT",
        "MA OATS",
        "Oats Marie 30",
      ),
      Product(
        "BISCUIT",
        "DF SANDWICH",
        "DF Choco 30",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Slice Choco 30",
      ),
      Product(
        "BISCUIT",
        "MA OATS",
        "Oats Marie 15",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 5 Seed 60",
      ),
      Product(
        "BISCUIT",
        "MP CREAM",
        "Bounce Orange Rectangle 05",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 30",
      ),
      Product(
        "BISCUIT",
        "GLUCOSE",
        "Glucose 20",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Digestive 5 Grain 1Kg 159",
      ),
      Product(
        "BISCUIT",
        "MOMS MAGIC",
        "Moms Choco Chips 30",
      ),
      Product(
        "BISCUIT",
        "YUMFILLS",
        "Yumfills  150",
      ),
      Product(
        "BISCUIT",
        "MA LIGHT",
        "Marie Light 30  East",
      ),
      Product(
        "BISCUIT",
        "DF FILLS",
        "DF BIG Fills 75",
      ),
      Product(
        "BISCUIT",
        "ALL ROUNDER",
        "ALL ROUNDER CREAM&HERB 20",
      ),
      Product(
        "BISCUIT",
        "FARMLITE",
        "Farmlite Oats Almonds 50",
      ),
      Product(
        "BISCUIT",
        "BOURBON",
        "DF Bourbon 90",
      ),
      Product(
        "BISCUIT",
        "SUNFEAST CAKER",
        "Caker Swiss Roll Choco 120",
      ),
    ];
  }
}
