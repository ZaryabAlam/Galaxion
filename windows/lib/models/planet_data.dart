class PlanetInfo {
  final double position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(0,
      name: 'Sun',
      iconImage: 'planets/sun1.png',
      description:
          "The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly as light, ultraviolet, and infrared radiation, and is the most important source of energy for life on Earth.",
      images: [
        'https://i0.wp.com/eos.org/wp-content/uploads/2022/02/illustration-solar-orbiter-sun.png?fit=1200%2C675&ssl=1',
        'https://www.thoughtco.com/thmb/Vo0-sNs3PfSnIHvXQJSzRTlVszY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/462977main_sun_layers_full-5a83345e875db90037f173c3.jpg',
        'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638882786/EducationHub/photos/sun-blasts-a-m66-flare.jpg',
        'https://static.toiimg.com/thumb/msid-99620278,width-1280,height-720,resizemode-4/.jpg',
        'https://static01.nyt.com/images/2020/05/19/science/30TB-BORINGSUN1/merlin_172064805_d476abdd-f4da-4015-8ca3-8c45c92c61fa-articleLarge.jpg?quality=75&auto=webp&disable=upscale',
      ]),
  PlanetInfo(1,
      name: 'Mercury',
      iconImage: 'planets/mercury1.png',
      description:
          "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Day temperatures can reach a scorching 840  F (450 C), which is hot enough to melt lead. Meanwhile on the night side, temperatures drop to minus 290 F (minus 180 C).",
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/800px-Mercury_in_true_color.jpg',
        'https://earthhow.com/wp-content/uploads/2018/06/Mercury-900x900.jpg',
        'https://s.yimg.com/ny/api/res/1.2/S77wbp90B85wzRPNcvyoIQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02MDM-/https://media.zenfs.com/en/popular_mechanics_642/94388cc455a7b77e589a555f1afe86b7',
        'https://cdn.vox-cdn.com/thumbor/ToTiH15D674RkEblayuJG3Vle6Q=/0x54:800x654/1400x1400/filters:focal(0x54:800x654):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49511269/NorthernVolcanicPlains_PDS15-sm.0.png',
        'https://c.tadst.com/gfx/1200x630/mercury.jpg?1',
      ]),
  PlanetInfo(2,
      name: 'Venus',
      iconImage: 'planets/venus1.png',
      description:
          "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even hotter than Mercury. The average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets.",
      images: [
        'https://fox5sandiego.com/wp-content/uploads/sites/15/2023/06/AdobeStock_58627825-1.jpeg?w=2560&h=1440&crop=1',
        'https://earthhow.com/wp-content/uploads/2018/08/Venus-900x900.jpg',
        'https://starwalk.space/gallery/images/amazing-planet-venus/1920x1080.jpg',
        'https://www.sciencenews.org/wp-content/uploads/2023/04/033123_MT_Venus_feat.jpg',
        'https://images.newscientist.com/wp-content/uploads/2021/04/29112534/2amj054_web.jpg?crop=1:1,smart&width=1200&height=1200&upscale=true',
      ]),
  PlanetInfo(3,
      name: 'Earth',
      iconImage: 'planets/earth1.png',
      description:
          "The third planet from the sun, Earth is a waterworld, with two-thirds of the planet covered by ocean. It's the only world known to harbor life. Earth's atmosphere is rich in nitrogen and oxygen. Earth's surface rotates about its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).",
      images: [
        'https://images.theconversation.com/files/379516/original/file-20210119-15-tmyvf4.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop',
        'https://st2.depositphotos.com/2273093/5926/i/450/depositphotos_59260229-Structure-of-the-Earth.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/STS41B-35-1613_-_Bruce_McCandless_II_during_EVA_%28Retouched%29.jpg/800px-STS41B-35-1613_-_Bruce_McCandless_II_during_EVA_%28Retouched%29.jpg',
        'https://nationaltoday.com/wp-content/uploads/2022/06/10-Earth-Month-1200x834.jpg.webp',
        'https://www.thoughtco.com/thmb/bZbxog9GJSRxvMN9ZfHiXZLVRyo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Earth_Eastern_Hemisphere-56a8cda43df78cf772a0cc74.jpg',
        'https://hips.hearstapps.com/hmg-prod/images/earth-from-space-royalty-free-image-1586891936.jpg?crop=1.00xw:0.889xh;0,0&resize=1200:*',
      ]),
  PlanetInfo(3.5,
      name: 'Moon',
      iconImage: 'planets/moon1.png',
      description:
          "The Moon is Earth's only natural satellite. Its diameter is about one-quarter of Earth's, making it the fifth largest satellite in the Solar System and the largest and most massive relative to its parent planet. It is larger than all known dwarf planets in the Solar System. The first artificial object to reach the Moon was the Soviet Union's uncrewed Luna 2 spacecraft in 1959. The only human lunar missions to date have been those of the United States' Apollo program, which landed twelve men on the surface between 1969 and 1972.",
      images: [
        'https://assets.vogue.in/photos/63b53955ca525deacf280628/master/pass/Full%20moon.jpeg',
        'https://www.sciencenews.org/wp-content/uploads/2022/12/120222_JR_50YA-Apollo-17_feat-1030x578.jpg',
        'https://cdn.mos.cms.futurecdn.net/DMLwZCcWy25RhSYoszqsjN-1200-80.jpg',
        'https://npr.brightspotcdn.com/dims4/default/de79bd2/2147483647/strip/true/crop/4217x2372+0+141/resize/1200x675!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Fa3%2Fc0%2F29c4ccdb4f1faacb8c5f0a4defd3%2Fadobestock-238657363.jpeg',
        'https://images.immediate.co.uk/production/volatile/sites/25/2019/04/Phases_of_moon-HEADER-491cdb0.jpg?quality=90&resize=940,627',
        'https://cdn.britannica.com/24/71324-050-894661C8/Edwin-Aldrin-Moon-July-20-1969.jpg',
      ]),
  PlanetInfo(4,
      name: 'Mars',
      iconImage: 'planets/mars1.png',
      description:
          "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. ",
      images: [
        'https://starwalk.space/gallery/images/mars-the-ultimate-guide/1920x1080.jpg',
        'https://earthhow.com/wp-content/uploads/2017/06/Mars-1536x1536.jpg',
        'https://www.worldatlas.com/upload/bb/c3/32/shutterstock-1041249343.jpg',
        'https://cdn.mos.cms.futurecdn.net/tsRQNTJ8MhRUm32taXTdjm.jpg',
        'https://th-thumbnailer.cdn-si-edu.com/GpbcEx_jleLWv0tzKlEzFqjOMiU=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/a8/86/a8862e13-e168-4b4e-824c-744ae6772924/screen_shot_2021-08-24_at_32601_pm.png',
      ]),
  PlanetInfo(5,
      name: 'Jupiter',
      iconImage: 'planets/jupiter1.png',
      description:
          "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. And a major feature in its swirling clouds is the Great Red Spot, a giant storm more than 10,000 miles wide. It has raged at more than 400 mph for the last 150 years, at least. Jupiter has a strong magnetic field, and with 75 moons, it looks a bit like a miniature solar system.",
      images: [
        'https://s.hdnux.com/photos/01/31/33/56/23444366/3/rawImage.jpg',
        'https://earthhow.com/wp-content/uploads/2018/08/Jupiter-900x900.jpg',
        'https://images.newscientist.com/wp-content/uploads/2019/05/21162807/pia21978.jpg',
        'https://imageio.forbes.com/specials-images/imageserve/5e5523d4d378190007f43e73/Jupiter-as-taken-by-NASA-s-Juno-spacecraft-on-its-recent-pass---perijove-25---and/960x0.png?format=png&width=960',
        'https://cdn.vox-cdn.com/thumbor/S04YX8hztaNM_ln56tZlxCWncMs=/615x0:3191x1288/fit-in/1200x600/cdn.vox-cdn.com/uploads/chorus_asset/file/10842939/pia21974.jpg',
      ]),
  PlanetInfo(6,
      name: 'Saturn',
      iconImage: 'planets/saturn1.png',
      description:
          "The sixth planet from the sun, Saturn is known most for its rings. When polymath Galileo Galilei first studied Saturn in the early 1600s, he thought it was an object with three parts: a planet and two large moons on either side. Not knowing he was seeing a planet with rings, the stumped astronomer entered a small drawing — a symbol with one large circle and two smaller ones — in his notebook, as a noun in a sentence describing his discovery. More than 40 years later, Christiaan Huygens proposed that they were rings. The rings are made of ice and rock and scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons.",
      images: [
        'https://www.sciencefriday.com/wp-content/uploads/2022/09/saturn-rings.jpg',
        'https://earthhow.com/wp-content/uploads/2018/08/Saturn-900x900.jpg',
        'https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL25vdy1lNWI5NWZiYS04OGUzLTRjMTYtYmMyYS0zNGY4NzM5ZTQzMTAtMTIxMC02ODAuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoiMTIwMCJ9fX0=',
        'https://cdn.cdnparenting.com/articles/2019/03/20144216/600658802-H.webp',
        'https://cdn.forumcomm.com/dims4/default/2c6c62c/2147483647/strip/true/crop/928x619+0+62/resize/840x560!/quality/90/?url=https%3A%2F%2Fforum-communications-production-web.s3.us-west-2.amazonaws.com%2Fbrightspot%2Fc3%2Fd3%2Fb2a5bbc147c5befe499acf84e88a%2Fsw-photo-for-aug-26-28-2022.jpg',
      ]),
  PlanetInfo(7,
      name: 'Uranus',
      iconImage: 'planets/uranus1.png',
      description:
          "The seventh planet from the sun, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side. Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. That tilt causes extreme seasons that last 20-plus years, and the sun beats down on one pole or the other for 84 Earth-years at a time. ",
      images: [
        'https://glamadelaide.com.au/wp-content/uploads/2022/09/Uranus.png',
        'https://earthhow.com/wp-content/uploads/2018/04/Uranus-900x900.jpg',
        'https://www.astronomy.com/wp-content/uploads/sites/2/2023/03/Uranussideways.jpg',
        'https://imageio.forbes.com/specials-images/imageserve/625e63706b5b12972afd46db/Miranda--Uranus-V--orbiting-around-Uranus-planet-in-the-outer-space--3d-render/960x0.jpg?format=jpg&width=960',
        'https://images.immediate.co.uk/production/volatile/sites/25/2020/04/Hubble_Uranus-7f9693c.jpg?quality=90&resize=980,654',
      ]),
  PlanetInfo(8,
      name: 'Neptune',
      iconImage: 'planets/neptune1.png',
      description:
          "The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds. Neptune is far out and cold. The planet is more than 30 times as far from the sun as Earth. Neptune was the first planet predicted to exist by using math, before it was visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.",
      images: [
        'https://a-z-animals.com/media/2022/07/iStock-527343985.jpg',
        'https://earthhow.com/wp-content/uploads/2018/08/Neptune-900x900.jpg',
        'https://www.ox.ac.uk/sites/files/oxford/styles/ow_medium_feature/s3/field/field_image_main/neptune.jpg?itok=S6Y2Rd-q',
        'https://www.2spirits.com/wp-content/uploads/2023/02/Neptune-Planet.jpg',
        'https://fintech.global/wp-content/uploads/2022/05/nasa-m35LirqP6y8-unsplash.jpg',
      ]),
  PlanetInfo(9,
      name: 'Pluto',
      iconImage: 'planets/pluto1.png',
      description:
          "Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun. It is the largest known trans-Neptunian object by volume, by a small margin, but is slightly less massive than Eris.",
      images: [
        'https://cdn.mos.cms.futurecdn.net/DoZSMXF87kCuzbymsuEFHo.jpg',
        'https://cdn.mos.cms.futurecdn.net/KAkFVy4xb7M22ufs4y8SEK-1200-80.jpg.webp',
        'https://cdn.britannica.com/58/194458-050-57271A88/image-expanse-Pluto-spacecraft-Imaging-Camera-New.jpg',
        'https://www.popsci.com/uploads/2019/03/18/4IT6RODTELPK2MUSWQA44XPIME.jpg?auto=webp',
        'https://cdn.shopify.com/s/files/1/0552/2423/8103/articles/Pluto_2048x.progressive.jpg?v=1637268885',
      ]),
];
