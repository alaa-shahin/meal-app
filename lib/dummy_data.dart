import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meal.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    color: Colors.brown,
  ),
  Category(
    id: 'c2',
    color: Colors.redAccent,
  ),
  Category(
    id: 'c3',
    color: Colors.orangeAccent,
  ),
  Category(
    id: 'c4',
    color: Colors.amberAccent,
  ),
  Category(
    id: 'c5',
    color: Colors.blueAccent,
  ),
  Category(
    id: 'c6',
    color: Colors.blueGrey,
  ),
  Category(
    id: 'c7',
    color: Colors.grey,
  ),
  Category(
    id: 'c8',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    color: Colors.pinkAccent,
  ),
  Category(
    id: 'c10',
    color: Colors.teal,
  ),
];

const DUMMY_MEALS = const [
  Meal(
    id: 'm1',
    categories: [
      'c1',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'https://img.youm7.com/xlarge/201709041040504050.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=clg5bamBwRM',
    videoUrlEn: 'https://www.youtube.com/watch?v=0pYrbcf8SXc',
    duration: 40,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c1',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'https://www.justfood.tv/big/0RISOTTO.RECIPE.HOW.TO.facebook.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=UMu2DBTkfBw',
    videoUrlEn: 'https://www.youtube.com/watch?v=NKtR3KpS83w',
    duration: 40,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c1',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://img.atyabtabkha.com/wtKJiomqjA4ApzRoeF4cpdH8Wko=/0x0/smart/https://harmony-assets-live.s3.amazonaws.com/image_source/cf/40/cf40143194aaffd3d51dc4492fcff24515df8d60.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=EMRmwcAxbtc',
    videoUrlEn: 'https://www.youtube.com/watch?v=Mprr5Q5Z7H4',
    duration: 30,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c2',
    ],
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.sotor.com/thumbs/fit630x300/24094/1580831969/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9_%D8%B9%D9%85%D9%84_%D8%A7%D9%84%D8%AC%D9%85%D8%A8%D8%B1%D9%8A_%D8%A8%D8%A7%D9%84%D8%AB%D9%88%D9%85_%D9%88%D8%A7%D9%84%D9%84%D9%8A%D9%85%D9%88%D9%86.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=uJgZ8Y5nrKs',
    videoUrlEn: 'https://www.youtube.com/watch?v=QGAJokcwBXI',
    duration: 25,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c3',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://www.simplyrecipes.com/thmb/ex1vc9D59TSmjzrkudhbAYselcI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Nicoise-Salad-LEAD-10-3c64a6f8d5834783916a2de4e3287464.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=VwBpHPI3Euo',
    videoUrlEn: 'https://www.youtube.com/watch?v=AZz57PwZFx8',
    duration: 20,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c4',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Challenging,
    imageUrl: 'https://img.youm7.com/large/201705220319481948.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=xoe7iTm4iYQ',
    videoUrlEn: 'https://www.youtube.com/watch?v=zWdNI_pRvi0',
    duration: 35,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c5',
    ],
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://kitchen.sayidaty.net/uploads/small/5c/5c6e1fd7dc889d6f280857270055baa8_w750_h750.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=F9qJE67gtDE',
    videoUrlEn: 'https://www.youtube.com/watch?v=xb2l4Tu96Y0',
    duration: 200,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c7',
    ],
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=Z1EEsLOgSj4',
    videoUrlEn: 'https://www.youtube.com/watch?v=gXpiGKf7ixA',
    duration: 35,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c6',
    ],
    affordability: Affordability.Luxurious,
    complexity: Complexity.Hard,
    imageUrl:
        'https://www.thaqafnafsak.com/wp-content/uploads/2016/03/%D8%AF%D8%AC%D8%A7%D8%AC-%D8%A8%D8%A7%D9%84%D8%B9%D8%B3%D9%84-%D9%88%D8%A7%D9%84%D8%B3%D9%85%D8%B3%D9%85-33.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=HXkGOI2tq0s',
    videoUrlEn: 'https://www.youtube.com/watch?v=xAqqkaNlmIg',
    duration: 40,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c10',
    ],
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=tfg9cZqdAm0',
    videoUrlEn: 'https://www.youtube.com/watch?v=K296hExJYMc',
    duration: 30,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm11',
    categories: [
      'c8',
    ],
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://www.thaqafnafsak.com/wp-content/uploads/%D9%83%D9%8A%D9%81%D9%8A%D8%A9-%D8%B9%D9%85%D9%84-%D8%A7%D9%84%D8%B3%D9%88%D8%B4%D9%8A-%D8%AB%D9%82%D9%81-%D9%86%D9%81%D8%B3%D9%83-10.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=OS8NMl-1IUc&t=94s',
    videoUrlEn: 'https://www.youtube.com/watch?v=jOSn-_HnZks',
    duration: 30,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c9',
    ],
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://shamlola.s3.amazonaws.com/Shamlola_Images/5/src/f8db85f951f16107e79fcd7522791b60a525726a.jpg',
    videoUrlAr: 'https://www.youtube.com/watch?v=TrGGDl448y0',
    videoUrlEn: 'https://www.youtube.com/watch?v=UWIyROT0jzo&t=25s',
    duration: 30,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: false,
  ),
];
