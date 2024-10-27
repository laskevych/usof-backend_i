DROP DATABASE IF EXISTS usof_irepeshko;
CREATE DATABASE usof_irepeshko;

USE usof_irepeshko;

DROP TABLE IF EXISTS `likes`;
DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `posts_favorites`;
DROP TABLE IF EXISTS `posts_categories`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `login` VARCHAR(50) NOT NULL,
   `fullName` VARCHAR(50),
   `password` VARCHAR(150) NOT NULL,
   `email` VARCHAR(250) NOT NULL,
   `isVerified` BOOLEAN NOT NULL DEFAULT FALSE,
   `profilePicture` VARCHAR(50) DEFAULT 'default.png',
   `rating` INT(10) NOT NULL DEFAULT 0,
   `role` ENUM ('user', 'admin') DEFAULT 'user' NOT NULL,
   `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `login` (`login`),
   UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(150) NOT NULL,
   `content` TEXT NOT NULL,
   `status` ENUM ('active', 'inactive') DEFAULT 'active' NOT NULL,
   `showOnHomepage` BOOLEAN DEFAULT FALSE,
   `likes` INT(10) DEFAULT 0,
   `creationById` INT(10) UNSIGNED NOT NULL,
   `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   INDEX `posts_creationById_i` (creationById),
   CONSTRAINT `foreign_key_posts_creationById`
       FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
           ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `categories` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(250) DEFAULT '',
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts_categories` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INT(10) UNSIGNED NOT NULL,
    `categoryId` INT(10) UNSIGNED NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_category` (`postId`, `categoryId`),
    INDEX `posts_categories_categoryId_i` (categoryId),
    INDEX `posts_categories_postId_i` (postId),
    CONSTRAINT `foreign_key_posts_categories_postId`
        FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_posts_categories_categoryId`
      FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`)
          ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts_favorites` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `postId` INT(10) UNSIGNED NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_user` (`postId`, `creationById`),
    INDEX `posts_favorites_creationById_i` (creationById),
    CONSTRAINT `foreign_key_posts_favorites_creationById`
        FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_posts_favorites_postId`
         FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
             ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `comments` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INT(10) UNSIGNED NOT NULL,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `content` TEXT NOT NULL,
    `isHelpful` BOOLEAN DEFAULT FALSE,
    `status` ENUM ('active', 'inactive') DEFAULT 'active' NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `comments_postId_i` (postId),
    INDEX `comments_creationById_i` (creationById),
    CONSTRAINT `foreign_key_comments_postId`
        FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_comments_creationById`
      FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
          ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `likes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `postId` INT(10) UNSIGNED NULL,
    `commentId` INT(10) UNSIGNED NULL,
    `type` ENUM ('like', 'dislike') DEFAULT 'like' NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `comment_like_user_unique` (`creationById`, `commentId`),
    UNIQUE KEY `post_like_user_unique` (`creationById`, `postId`),
    INDEX `likes_commentId_i` (commentId),
    INDEX `likes_postId_i` (postId),
    INDEX `likes_creationById_i` (creationById),
    CONSTRAINT `foreign_key_likes_creationById`
       FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
           ON DELETE CASCADE,
    CONSTRAINT `foreign_key_likes_postId`
       FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
           ON DELETE CASCADE,
    CONSTRAINT `foreign_key_likes_commentId`
       FOREIGN KEY (`commentId`) REFERENCES `comments`(`id`)
           ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

USE usof_irepeshko;

/* Users */
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (1, 'alana76', 'Alana Murphy', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'alana_murphy@gmail.com', 1, 'default.png', 16, 'user', '2024-01-21 19:26:52');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (2, 'shayne.bruen66', 'Shayne Bruen', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'shayne_bruen75@hotmail.com', 1, 'default.png', 14, 'user', '2024-03-22 08:33:44');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (3, 'dayton.veum15', 'Dayton Veum', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'dayton.veum46@yahoo.com', 1, 'default.png', 20, 'user', '2024-09-17 01:52:26');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (4, 'madyson39', 'Madyson Hintz', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'madyson.hintz64@yahoo.com', 1, 'default.png', 18, 'user', '2024-07-12 06:15:01');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (5, 'mya_okon88', 'Mya O''Kon', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'mya.okon@gmail.com', 1, 'default.png', 19, 'user', '2024-08-30 11:54:54');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (6, 'burnice13', 'Burnice Beier', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'burnice.beier92@hotmail.com', 1, 'default.png', -2, 'user', '2024-06-27 07:55:06');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (7, 'retha56', 'Retha Kertzmann', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'retha.kertzmann@gmail.com', 1, 'default.png', 14, 'user', '2024-05-30 08:56:58');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (8, 'harmon_damore', 'Harmon D''Amore', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'harmon_damore51@gmail.com', 1, 'default.png', 21, 'user', '2024-01-20 09:15:37');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (9, 'emmy9', 'Emmy Langworth', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'emmy.langworth@gmail.com', 1, 'default.png', 22, 'user', '2024-09-05 02:02:59');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (10, 'jody_dietrich', 'Jody Dietrich', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'jody.dietrich@hotmail.com', 1, 'default.png', -4, 'user', '2024-02-17 12:15:11');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (11, 'eleanore55', 'Eleanore Beier', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'eleanore_beier40@gmail.com', 1, 'default.png', 45, 'user', '2024-02-09 19:54:24');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (12, 'evert.harvey', 'Evert Harvey', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'evert_harvey93@hotmail.com', 1, 'default.png', 16, 'user', '2024-01-27 17:54:19');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (13, 'elias_cruickshank26', 'Elias Cruickshank', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'elias_cruickshank34@gmail.com', 1, 'default.png', 3, 'user', '2024-06-19 02:27:38');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (14, 'joanny27', 'Joanny Larkin', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'joanny_larkin56@yahoo.com', 1, 'default.png', -3, 'user', '2024-06-14 17:55:39');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (15, 'samanta83', 'Samanta Huels', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'samanta.huels91@yahoo.com', 1, 'default.png', 15, 'user', '2024-09-23 18:43:30');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (16, 'admin', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$jIHvPnZNS4D/7hMnjBrhq8HbcSqHjU4/aHNYBCWQsa8', 'admin@gmail.com', 1, 'default.png', 0, 'admin', '2024-10-27 16:09:09');

/* Posts */
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (1, 'Arceo vindico arbustum admiratio somnus amoveo debitis videlicet tertius ullam.', 'Rem vix acceptus cometes torrens conservo omnis surculus. Combibo ambitus tersus aetas arbustum audentia vae aeneus. Verbera itaque voluptatibus contabesco ulciscor.
Thalassinus demo confugo tot causa supellex infit correptius a. Reprehenderit victoria subito bene vitae aduro copiose. Vulgivagus cubo amplus peior.
Adhuc confugo aegre cum umbra collum aperte curia tamen ullus. Deputo sub alias textus stips approbo. Peior aspicio delectatio collum temporibus nam demulceo angustus.', 'active', 0, 2, 4, '2024-01-21 00:28:05');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (2, 'Conventus cernuus autus vomito.', 'Varietas taceo minus pecus derelinquo aegrotatio attollo uredo coerceo articulus. Tot modi depono peior comparo coadunatio assumenda alias. Una capillus earum.
Vorax bis censura brevis aequus tibi arcesso arcus. Adiuvo trepide amaritudo sto adfectus. Copiose crebro denique corrumpo vulgaris vester cribro crux ascit solium.
Vacuus veritatis et admoneo ratione deripio comedo depereo vinitor trucido. Triduana textilis vitium dignissimos aggero delibero allatus. Benevolentia autem deserunt socius congregatio atqui contra.', 'inactive', 0, 6, 4, '2024-09-30 02:32:27');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (3, 'Acies tubineus color tamdiu adsidue constans aggredior beatae vulgaris.', 'Colo adamo dens volaticus stillicidium cur validus. Ante tum libero ager delectatio ventosus occaecati caelestis. Thesis desipio animi.
Suus amet animi. Trado depromo surculus suffragium advenio timidus ullam tempore veniam. Pax uxor temperantia utor conatus ambulo solum congregatio auxilium arbitro.
Suppono volubilis balbus. Vitium audax arcesso bestia verecundia ter accendo. Veritatis caterva callide.', 'active', 1, 3, 2, '2024-06-22 10:43:55');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (4, 'Turpis universe facilis vespillo.', 'Alo usque torqueo aufero collum sum creta clarus. Vir distinctio aspernatur magni deprecator confugo. Abscido aestus crastinus tam alii.
Despecto angelus culpa. Trucido ancilla coruscus sumo socius sto adulatio esse. Claustrum alius harum.
Cetera commodo nisi. Aestivus tam allatus tripudio teneo arguo trans consectetur reiciendis. Architecto vivo trado.', 'inactive', 1, 2, 15, '2024-01-23 15:26:05');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (5, 'Cogo maiores alo ullam quibusdam vulnus trans tam crastinus aliquam.', 'Carbo adfero censura paulatim ambulo deprimo. Advoco vulgo voluptatibus. Id sub ipsam tergiversatio corrupti adficio.
Quam crur adopto adhuc alii vorax tabula. Perspiciatis angustus alo crinis benevolentia tempus traho altus. Vigor arma demitto turbo astrum baiulus.
Arx voluptatibus canto. Conduco teneo audeo cubicularis confugo nostrum dens ultra villa. Depereo auditor audio totus cedo.', 'inactive', 0, 6, 14, '2024-07-16 22:01:25');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (6, 'Quibusdam cogo subseco accusantium.', 'Cuius admiratio modi cui. Corroboro testimonium comburo. Bis textilis depromo vestrum theatrum appono strenuus repudiandae.
Argentum cohors vir varietas. Cultura comitatus vallum allatus desparatus dapifer textor testimonium. Vestigium tollo cribro artificiose.
Possimus termes ver voluptatum dolor sodalitas comprehendo vomer ustilo. Cohibeo tersus quasi damno vae. Assentator verecundia corrupti conservo suadeo strues vaco cur vesica.', 'active', 0, 4, 6, '2024-02-17 00:29:19');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (7, 'Ter aequitas unus via suppono.', 'Delinquo conculco textor ascit terga viriliter maxime vestigium. Abduco argumentum centum adhuc adduco torrens validus desparatus. Decipio sodalitas vox viduo vacuus baiulus coadunatio commemoro natus.
Torqueo convoco bibo trepide adsum commodi. Appello tenetur ultio chirographum vox. Ait eveniet harum assumenda illo adduco cetera speciosus vilis.
Curatio ultio arma confido labore amet. Sono derideo reiciendis. Deludo adaugeo a corroboro acer carmen dignissimos.', 'inactive', 0, 4, 15, '2024-04-11 01:17:30');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (8, 'Defessus aurum cras cedo stabilis.', 'Aestus vinitor benevolentia turpis coerceo arbustum sonitus vero. Cunabula accendo aedificium asper tonsor carbo speculum tergum vinum. Dens acerbitas consuasor delectus arcesso ascisco cena absorbeo.
Ustulo tandem rem. Consectetur sapiente agnosco cogito convoco adficio tergiversatio. Adsuesco adinventitias caries verbum accusator adopto suus administratio vivo.
Aureus concedo officia vobis accendo. Spoliatio causa apto terga universe audacia cornu sollicito. Solitudo adstringo delectatio summisse versus vigilo comis corrupti.', 'active', 0, 3, 11, '2024-09-20 23:36:31');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (9, 'Cariosus verecundia vinculum sperno.', 'Theologus celer voveo tricesimus. Ipsa ubi cunae vestrum copiose vapulus celo abstergo odit. Atavus arcesso commemoro tendo animus audax.
Comminor depopulo atrocitas repellendus crepusculum teres ulciscor occaecati ambulo patrocinor. Cognomen vulgus adipiscor tribuo. Acer taceo suggero strenuus adstringo terreo.
Cura alioqui turpis capio casso supplanto arca votum una. Sopor succedo stillicidium anser credo cum ultio urbanus decimus triduana. Sperno comes theca.', 'active', 1, 3, 15, '2024-03-19 00:54:23');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (10, 'Temperantia voco atrocitas vita.', 'Brevis compono sui. Creta adipiscor apto voluntarius volo cupiditas cunctatio libero denego sodalitas. Spes coma vitiosus uredo comprehendo curto voluptatibus custodia tempus.
Deorsum tutamen vitium deserunt. Animadverto ut illum subiungo. Adaugeo curis illum venia adipiscor vorago spiritus.
Abbas comprehendo caritas caries congregatio utpote celebrer. Careo cupressus tot thesaurus tamdiu beatus tabella decipio quaerat ulterius. Viscus tyrannus vesica cum corpus.', 'active', 0, 6, 5, '2024-06-09 18:38:58');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (11, 'Ter auxilium modi quaerat admitto molestiae ustulo aptus tenax.', 'Carpo valetudo aliquam. Dens vallum unde sonitus cernuus demum fugit. Vulgo demum trepide statua summa campana talus quae.
Chirographum velut utpote recusandae. Decumbo atqui carus theatrum in ulciscor crapula. Tergo substantia bibo acies tutamen arbitro minus tempus crepusculum vulnero.
Certe convoco esse. Modi adfero barba amissio. Caste confido voluptatem ceno astrum celebrer sodalitas cubo contabesco.', 'inactive', 0, 6, 10, '2024-08-18 02:16:00');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (12, 'Umbra ullus bonus vere voluptate.', 'Tibi defessus adimpleo conspergo ademptio stips trepide. Aro adeo confero vorax. Versus crudelis subnecto carmen coadunatio absum crustulum dapifer.
Cursus atavus bonus absorbeo tutamen advenio crapula at. Comis appello minima. Spargo crudelis adimpleo dolores nostrum sublime.
Synagoga amicitia beatae cernuus paens vorax calamitas tutis demum artificiose. Defungo abduco toties ex expedita nam nisi volutabrum. Tempora clam autus tabella curtus fugiat molestias consequatur amiculum.', 'active', 0, 2, 14, '2024-05-28 01:01:56');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (13, 'Nisi paulatim angustus coruscus textilis.', 'Sunt patrocinor suffoco stillicidium blandior argentum cogo copia. Vomer praesentium strues. Aeneus averto vae vix delinquo acsi balbus aranea caecus dens.
Utroque porro alias adulatio stultus comes condico virtus apparatus vulticulus. Tristis acerbitas combibo curvo admoneo adhaero. Amiculum tempora quia crepusculum tantillus magnam bellicus minus color tutamen.
Spiritus sapiente cupio consectetur conqueror vilitas conor voluptatem auctus. Subvenio tolero umbra aptus amiculum autem convoco. Defero audax cresco colo crapula amiculum iure.', 'inactive', 1, 3, 13, '2024-02-06 05:47:08');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (14, 'Vis enim stips aliquid curtus tremo libero exercitationem administratio deserunt.', 'Cui omnis atrox porro vergo. Caput ara tristis aer. Tergeo tero quod.
Delego inflammatio molestiae contego suffragium sui cubitum ex soluta adicio. Sapiente aestas tam. Compono coma sum amitto doloremque arbor tero vero.
Velum virgo advoco perspiciatis torqueo vado agnitio veritatis. Vesper tepidus crur carbo anser civitas cresco delicate supra carcer. Dapifer theologus perspiciatis.', 'active', 0, 3, 4, '2024-08-30 04:38:37');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (15, 'Dolore ad coniecto conspergo fugit suggero currus saepe.', 'Usitas ventosus aegrus suadeo. Crinis alioqui vitium id conor vos clarus victus curto vix. Neque vesper beneficium.
Pax sint defetiscor conventus sum quae conturbo bellum fuga. Dignissimos suffoco architecto est depono arbor vergo illo. Custodia distinctio undique virga inflammatio conculco laboriosam tabula cohaero aestas.
Defetiscor viridis succedo cavus tergum catena. Creptio eveniet dolor sollers capio. Dolorum pecus aeger accusamus thymum tumultus.', 'inactive', 0, 7, 12, '2024-06-27 15:18:19');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (16, 'Confugo aufero volo degusto tam suggero.', 'Caelestis arto eius adulescens. Amplexus suadeo arca ambulo caelestis attonbitus. Conventus video ventosus consequuntur capitulus commodi voluptate atrocitas.
Varius despecto talus a curto aufero. Verumtamen corrumpo arbor dolorem pectus natus patria. Urbanus odit commodo turba eveniet.
Acceptus alii aliqua earum amaritudo aurum confugo vilicus caritas tibi. Libero hic decipio. Adflicto vix ab contego versus ocer delinquo in.', 'inactive', 1, 6, 11, '2024-02-24 03:27:53');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (17, 'Abutor accedo capto fuga summa absorbeo.', 'Tabgo auctor molestiae viduo creator admoveo coepi taceo hic arma. Surculus virga ut cohaero. Accusantium numquam decet.
Thesaurus venio subito asporto eligendi traho contego consectetur vinum ulciscor. Cresco video corporis comes cum acervus curso. Tersus claustrum verecundia apud tergo dolores.
Advenio commemoro subvenio. Colo canonicus harum cuppedia textor copiose solvo abundans contra aurum. Amiculum voco minus advoco fugit claro confugo.', 'active', 1, 3, 13, '2024-01-08 04:12:28');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (18, 'Vesco delectatio torqueo vobis tantillus acies.', 'Charisma ocer bis aestus sulum cervus aut turbo bardus ante. Alienus sto defero sulum temporibus recusandae crinis balbus cognatus. Color utique acervus adipisci.
Confido sum cupio terror amoveo tubineus uterque cultura. Utroque debeo vilicus vox magni urbs auxilium. Vester vito coaegresco celebrer pauper reprehenderit viriliter creator.
Architecto decens abscido dolores aperio addo carcer caste quia. Antea aperte officia decor aequus comprehendo. Curtus deprecator dolorum.', 'inactive', 0, 4, 13, '2024-10-07 10:43:34');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (19, 'Assentator textor esse cohors talio vindico tolero.', 'Curvo conforto theologus aggredior dolore spero sumptus inflammatio uterque voluptatum. Cornu artificiose subseco. Vigilo pecus in argentum vesper verto.
Caecus iusto accusantium absorbeo. Depopulo amet vilicus caelestis arguo degusto. Texo ea crinis cervus aetas.
Delibero advoco trepide complectus patrocinor voco. Curiositas cattus stultus suppellex tribuo atrox terebro virga sonitus thema. Spectaculum abscido defungo illum ventito vesica sodalitas.', 'active', 0, 1, 3, '2024-06-13 05:59:40');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (20, 'Alveus statim cado.', 'Aetas aedificium demo dapifer abbas atavus. Minima conduco aureus cicuta compono varietas altus teneo. Colo vitae solus.
Capto ocer arcesso tutis sordeo. Absorbeo tabula averto depono sustineo. Caritas viduo acsi bellicus tepidus.
Alo carcer carcer. Thymbra sum aegre cado cuius color vociferor corpus temporibus curo. Corrupti ustulo acervus.', 'active', 0, 3, 1, '2024-02-07 10:59:47');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (21, 'Tibi vulgus trado aestas suppellex vito tersus arcus vehemens.', 'Creber patior tepidus teres alter subiungo voluntarius. Ante teneo certus aegre uberrime quam calcar acervus. Caput paens tener patrocinor adeo sopor delego.
Mollitia conturbo aqua utpote aestus carpo coerceo. Vulnero sit caelum cohors varius. Abscido vito umquam cerno modi arbustum alii vado civitas vos.
Cunae talis curo officiis cogo. Defluo complectus natus cattus. Compello conforto uberrime tempora.', 'inactive', 0, 7, 4, '2024-04-19 20:39:01');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (22, 'Videlicet ubi vorago cohaero fugiat.', 'Vere tempus comprehendo. Necessitatibus veniam auditor crinis valde repellendus temporibus vaco dolore curia. Cerno sortitus atrox admoveo vos succurro aut thorax.
Alii acsi demitto. Tam utrum similique denuo atqui tutis speciosus. Tenus aro dolore comminor utilis sopor.
Accusantium usque creber adamo aequitas repudiandae amplus inflammatio aduro curiositas. Tempora cupiditas aurum cauda. Curtus temeritas attollo collum adversus vulpes ambitus.', 'active', 0, 3, 14, '2024-06-29 06:33:15');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (23, 'Totam aiunt capitulus statim crustulum aequus.', 'Creta cinis terreo amoveo agnosco adfectus. Ultra doloribus eveniet turpis tolero vulgo abscido vacuus universe. Catena cernuus utrum cupio caute tenuis subseco coepi repudiandae esse.
Vos illum vos surculus commodi sit consuasor surgo contego facere. Voluptatem socius porro utor victoria studio deripio vesica. Suasoria beneficium suspendo accusamus surgo.
Valetudo solio coma iste abutor. Delectatio argentum excepturi adipisci comprehendo terga comedo toties. Sui bellicus fugiat.', 'inactive', 1, 3, 2, '2024-05-12 16:06:45');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (24, 'Corrumpo arx officia commemoro sustineo confido adamo torrens.', 'Sumo facere subvenio tergeo. Cubo temperantia arceo vinum curo tunc studio curiositas vivo tardus. Triduana conforto patria audacia suadeo.
Uter subito temeritas animi vesco vereor calco molestiae. Alioqui coniuratio sollicito convoco. Corpus curso suus utrimque.
Vindico numquam abutor valens claustrum eaque dedico alius. Circumvenio ver suasoria quia sapiente comburo deinde angustus. Calcar vis umquam balbus accedo.', 'inactive', 0, 6, 15, '2024-04-15 15:48:16');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (25, 'Coerceo adduco blandior centum degenero admitto ubi brevis necessitatibus succurro.', 'Arto suffragium comedo tergo cubitum minima ultra verecundia. Cenaculum vinum pauper bos argentum cubitum tabernus toties utor. Defetiscor adulatio corona.
Ab thalassinus nam. Paulatim amoveo talus voluptates ascisco culpo suadeo. Utrum vallum absum velit tres beneficium soluta.
Thermae amitto defendo triduana ambitus claro eum adinventitias conicio voluntarius. Tabula tumultus desolo possimus summa dolores censura coniecto vigor. Venustas usque annus communis comparo atque caveo.', 'active', 0, 4, 8, '2024-09-18 21:30:37');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (26, 'Aetas toties viduo vitae.', 'Dicta artificiose demulceo artificiose tardus ullam desparatus canto. Texo vilicus cupio ullus termes adaugeo. Tutis virtus desipio valetudo creptio tres.
Validus incidunt molestias maiores cilicium tui ara arcus taceo. Attonbitus comedo stillicidium abutor. Soleo solium thalassinus amaritudo sophismata deorsum absque undique angelus.
Illum absque depopulo tibi artificiose sto nobis crepusculum cursus. Vulgivagus stella universe adamo peior. Coruscus vulariter coaegresco statua calcar necessitatibus succurro.', 'active', 0, 6, 14, '2024-02-28 16:25:09');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (27, 'Curis harum umerus caput itaque virgo.', 'Tendo provident sordeo verto sequi. Nulla totam vulgaris vero vis coepi volo avarus delibero. Avaritia annus voluptas cuppedia abscido.
Assentator aiunt deporto. Addo vergo carbo sumptus. Voluptate tollo ancilla deripio suggero celo adflicto.
Corona capio ater constans arceo sophismata a quaerat. Conventus uredo volup clarus ad vesica cresco stultus turba coaegresco. Adiuvo auditor arto eaque torqueo vigilo demens cupressus asporto cinis.', 'inactive', 0, 1, 6, '2024-05-23 10:08:43');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (28, 'Vacuus taedium laborum vitae comis angelus thymbra.', 'Comparo quaerat vorax textor trado nemo et vis vulpes. Suppono theatrum nobis suppellex cumque tibi tantillus tripudio magni. Vinum degusto tutamen caute brevis.
Voveo verecundia deficio adversus tergeo bellicus turbo temeritas occaecati. Compello comedo crinis. Degenero nobis taceo alioqui odio thermae.
Bardus animus atrocitas theca thymum currus curatio acsi debilito argentum. Coma autus appello tersus aiunt ut denuo. Valetudo patruus vomer curriculum strues defessus abutor absconditus pecus ultra.', 'inactive', 0, 4, 14, '2024-03-06 20:33:43');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (29, 'Cultellus valens vix vado comes tot arguo nihil quidem vesica.', 'Conor ultra corpus umbra curiositas textilis constans aduro bos amplus. Ultra urbs centum coma adsum viriliter verbum voluptatibus. Placeat eveniet culpo.
Nulla vulgus vulgivagus bis. Delibero vix cerno credo tot sed conservo aveho. Ratione cruentus bos anser odit careo via cur carus.
Tres depraedor surgo aliquid vis. Thema victus crapula advoco subiungo trans patior viscus. Admoveo comitatus vigor correptius triumphus asper.', 'active', 0, 3, 1, '2024-05-07 05:53:46');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (30, 'Victoria conicio stipes clibanus vergo magni vinculum earum corporis.', 'Quam vociferor vesper vaco cilicium tam cumque. Aveho defungo volva autus adimpleo sint confugo dedecor supellex circumvenio. Aegre demulceo nostrum totus.
Cunctatio maxime conqueror ver degero clementia clamo omnis solio. Ascisco ager decumbo eius soluta appello vesica. Coadunatio timidus voluptas vero dedico venustas dolore culpo volubilis dolore.
Thorax tabella adicio solium venio caput. Quis conturbo cariosus vox vitae delicate doloremque comprehendo. Carpo illum quia sol earum antiquus.', 'inactive', 0, 3, 8, '2024-07-02 00:06:36');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (31, 'Velociter vinco tricesimus similique architecto.', 'Acies vacuus tam angelus aliqua talio minus suadeo ipsa. Apostolus cruciamentum facere adicio atqui. Comes claudeo cedo tondeo vinculum confugo.
Complectus arbor adsum turbo curia tamen curso decerno. Audio adulatio dolorum avaritia strues spoliatio thorax. Alter suspendo traho timor sortitus autus arguo.
Desidero aperio aro territo atque texo asperiores. Curto aiunt suscipit statua eveniet dolorem vilicus suffoco audax. Aeger quia alter cupio facilis tertius conduco cupressus.', 'inactive', 0, 5, 7, '2024-01-19 03:08:00');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (32, 'Solio caritas collum valde vester.', 'Crinis aspicio suus acer ustulo temporibus carcer. Facere dolores tui adiuvo voro voluptatem careo. Amicitia catena spectaculum curto candidus perspiciatis pecto villa crur.
Admoneo callide animi terminatio aut. Dolores demonstro verbera ascit nemo caveo vulgus tergeo. Vinum arguo ademptio bis ait urbs caute cito.
Turbo vehemens atqui aggredior virtus aurum veritatis tredecim abscido atque. Vilitas annus defetiscor. Admoneo alias autem soleo sumo eaque ulterius ustilo.', 'active', 0, 2, 7, '2024-09-06 13:18:49');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (33, 'Vobis vulnero alo.', 'Aut terreo templum dolorem corrigo clementia viscus stultus. Sopor tempora collum sumptus necessitatibus. Suus astrum adversus aperio adnuo sumo ultio terminatio claustrum.
Auditor despecto ciminatio aperte aggredior. Decens thymum velut. Minus crapula turba adimpleo angelus deficio ambitus.
Amo substantia ocer communis tamisium surculus cultellus aequus claustrum. Administratio spiritus ipsam. Depromo super tabesco.', 'active', 0, 7, 4, '2024-09-01 19:04:08');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (34, 'Carmen comminor aurum.', 'Defungo carcer undique consequuntur curto. Ipsum beatus cupio. Crebro adipiscor communis casso adeptio.
Deporto testimonium casus. Volaticus sophismata terreo. Aurum succurro tremo cubitum quam stips modi taedium corrigo.
Consequatur claudeo aestus nam. Aperte incidunt ullam acerbitas advoco dignissimos. Barba utpote ascit.', 'inactive', 0, 5, 3, '2024-08-26 08:45:54');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (35, 'Denique aurum voluptates audio talio valeo reiciendis torrens.', 'Attonbitus depromo umerus depopulo appositus vel appositus succurro veritas volo. Deputo tredecim asperiores tamen supra acer celo cedo. Vorax aliqua adfero alter comparo cervus magni adamo.
Ratione provident aqua cinis audacia pauper alveus. Alveus avarus ulterius caritas ceno depromo colligo benevolentia temptatio ager. Antiquus urbs templum.
Possimus consequatur commemoro accusamus velociter ceno delectus ascit tametsi. Ait consuasor cohibeo. Cito tyrannus denuncio despecto capitulus asper conor inflammatio volva atrox.', 'active', 0, 2, 8, '2024-03-18 10:30:22');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (36, 'Termes hic decumbo aggero defero tergum volup quo facere aegre.', 'Aliquam veniam traho testimonium quasi delinquo. Impedit sponte suspendo vulgaris voco adulatio subnecto porro deinde alter. Aer autem cultellus.
Tabula desparatus teneo stultus accendo tibi sublime. Cumque deputo eveniet spectaculum repellat vox. Eligendi corpus vulgus demo unde.
Uredo provident capitulus aufero cauda unde desipio capto adnuo. Una tepidus caelestis est. Cogito ubi abstergo admoneo atavus quo.', 'active', 0, 3, 6, '2024-06-05 06:19:20');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (37, 'Denique barba depromo aufero adnuo conscendo tamen.', 'Vobis campana testimonium ater. Porro admoveo amitto carpo volo clibanus vis. Trans sol nobis nemo demum defero damnatio.
Neque advoco voluptatum. Amita culpa vinco statim abeo arbor. Reiciendis assentator advenio dolorem arbor.
Subnecto synagoga argumentum cognatus tollo curtus comis termes crustulum tripudio. Stipes candidus comptus temptatio cernuus unde victoria articulus crepusculum. Autus tepesco bestia clamo.', 'active', 1, 6, 1, '2024-03-20 21:11:04');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (38, 'Abutor avarus illum.', 'Theologus cito beatus appositus alias vitiosus socius tego vicissitudo convoco. Templum accommodo villa defaeco crustulum architecto atavus carus. Numquam aperio cerno corrumpo praesentium supellex.
Vulnero verbera villa congregatio. Cribro strenuus attero titulus socius alienus socius turba. Colo deleniti conforto derelinquo cattus utrum.
Caries theatrum culpo virgo doloremque. Umbra bibo ambulo caveo ars. Deserunt in sol pauci officiis ceno crastinus tumultus vehemens.', 'inactive', 1, 4, 2, '2024-09-10 00:43:57');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (39, 'Ubi modi coma crapula demitto tot conventus.', 'Certus iste validus. Nobis temptatio acidus blanditiis denuo animi vulnus. Excepturi abstergo dolorem facilis virga benigne neque caritas solus sordeo.
Vetus volva supra aestivus sui spoliatio. Aperiam culpa derideo esse astrum. Vesco modi suppono pauci corporis carcer ascisco statua ulterius pecco.
Suggero valeo harum cura. Molestiae cupio absens cena suus. Caries ademptio cotidie adamo ustulo deprimo coaegresco apostolus angelus.', 'active', 0, 0, 12, '2024-05-14 02:54:10');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (40, 'Vita amplus audeo suasoria tantillus.', 'Uredo at aedificium argentum angelus coerceo tribuo deprecator quasi. Nesciunt absconditus amaritudo commemoro audio admitto nostrum doloremque arbor. Ambitus doloremque vesica comedo alo candidus.
Aeger dens victus despecto suppono. Ultra approbo autus virga vorago. Vester angulus deripio.
Depereo carbo id omnis supra pectus cunae tracto. Aeger tyrannus vinitor termes. Ater sodalitas aestas crustulum facere apud.', 'active', 0, 4, 13, '2024-06-03 16:14:43');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (41, 'Casso toties combibo suppono ait.', 'Tempora adduco aeger circumvenio carmen. Vesco avarus spes amplus deputo atrox caries xiphias adflicto voco. Spero stillicidium ultra abutor subito perferendis terreo territo acceptus celer.
Apto inventore allatus admoveo aedificium ex amaritudo terreo cimentarius. Cupressus constans tutis harum sit bene thalassinus avaritia conservo. Commemoro crapula derideo.
Tui qui cauda deleo quasi tepesco deprimo. Tutamen sol ambulo atrocitas amicitia derelinquo. Vulariter conservo altus arguo amplexus spoliatio volutabrum.', 'inactive', 0, 3, 9, '2024-05-28 12:43:37');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (42, 'Crux utpote correptius baiulus voluptatum adsuesco ultra textor.', 'Audio tabella ratione calculus sophismata distinctio desolo coadunatio ceno patria. Ascisco conatus conforto aestas aspicio beatae territo. Vapulus decerno canonicus solio sperno.
Ratione aestus claustrum mollitia aeneus statim cruentus velociter tepesco templum. Tepesco sonitus bis apto. Vir inventore tres spes super nobis.
Ventito cura addo cognomen clam ciminatio catena. Alo vinculum est. Cunae alius quidem vociferor caste torqueo videlicet deleo statim curtus.', 'active', 1, 5, 8, '2024-07-25 05:04:07');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (43, 'Doloribus turpis arceo circumvenio chirographum suffoco.', 'Charisma sollers verus mollitia tricesimus aestas consequuntur. Aequitas suffragium aestus cupiditate curtus sol. Tunc appello utpote approbo crapula denuo depereo antea.
Asperiores cometes umbra vinculum defleo vix aro via admoneo. Cubo ventosus cibo barba acerbitas tolero demum ante blanditiis excepturi. Collum acerbitas decens collum ad stultus deprecator agnitio suppono tempora.
Ago addo utilis sui. Umerus territo tantillus solium. Dedecor audentia adopto universe terga ulciscor adsuesco solitudo.', 'inactive', 0, 4, 11, '2024-04-27 07:24:14');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (44, 'Sustineo vitae vir cura thesaurus tero aro virga consuasor acies.', 'Denique audacia dignissimos eaque commemoro communis color supellex. Bis vacuus cariosus charisma dicta bibo adipiscor. Textor patruus causa sustineo supplanto.
Cohaero arto coma. Aperte ipsam et coepi sodalitas suspendo accommodo corpus. Vinculum suffoco tunc.
Suffragium solio deficio cornu absconditus campana cultura adhuc laboriosam aspernatur. Confugo molestiae aegrotatio voco cervus. Cumque vis undique decens voluptate quaerat aestas.', 'inactive', 1, 1, 14, '2024-03-06 19:51:16');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (45, 'Ater tremo id deficio fugit adimpleo temperantia.', 'Corona derideo aggredior tenax voveo cura sollicito agnitio ver. Pax absconditus coepi perferendis contigo ascisco. Ullus attero cubo.
Amo arx absconditus amo deprecator quasi eos decens vestrum caelum. Vere cribro ait accusantium. Conservo summopere conventus stabilis uxor depraedor arceo cupressus tamen.
Accusator conduco vergo decor sumo aegrus verus deinde tripudio pauci. Adsum coniecto acies autus vox. Vinum statua ustulo ago.', 'inactive', 0, 3, 10, '2024-09-02 21:22:16');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (46, 'Ea acsi trucido deporto.', 'Tabella consequatur autem vulgivagus vulariter communis urbs denique pecco. Admoveo veritas aperte cavus. Tempora adversus synagoga delibero volo sonitus arbor iste super.
Succurro dedecor ubi strues stella non arma undique acsi. Accusamus sumptus doloribus vulgus. Accommodo stultus cruciamentum deludo constans tollo verbera contego ventus.
Optio conscendo tres conatus. A crapula absorbeo stabilis conspergo. Cohibeo artificiose valde demonstro totidem totam via compello.', 'active', 0, 3, 14, '2024-07-24 21:36:29');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (47, 'Surculus terminatio molestiae capio occaecati adulescens.', 'Tenus molestias auditor comminor crux theca cogito id neque adamo. Voro defetiscor sponte defendo angustus tenuis. Centum adipiscor cuius ex.
Impedit dolor caritas tepesco blandior. Spargo sumptus volaticus copiose sui sopor aegrus sordeo conforto calamitas. Aer thesaurus solitudo viriliter sollers.
Patior harum alius defleo asporto vilitas vociferor. Tristis inflammatio venio ex verumtamen considero at audacia talus. Administratio molestias animadverto coerceo supra spargo xiphias.', 'active', 0, 2, 6, '2024-09-20 22:22:22');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (48, 'Vilis cibo tepesco vindico taedium conforto.', 'Dapifer casso patrocinor ulterius. Conqueror tres ascit attero beatus supellex. Tamen caste annus amoveo cribro totam.
Vestrum absens templum natus nobis rerum curia canto voluptatibus error. Aiunt toties alias animi cruentus capio veniam. Verus spiculum acies pecus admiratio deleniti uter aperio.
Demulceo tactus stillicidium templum. Benevolentia aspernatur hic curso beatus ipsam solitudo nihil. Ubi volubilis trepide tactus nesciunt astrum ultra viscus.', 'active', 0, 4, 5, '2024-08-28 14:51:30');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (49, 'Quibusdam bene surgo coniuratio venia venustas capio cognomen crapula.', 'Repudiandae numquam magni pel sordeo apud. Auctor cariosus vorago colo aeger necessitatibus velit. Arca laudantium sollicito arx sit corrigo cinis tener.
Confero conturbo statua aduro amicitia. Ater vesica causa vorax constans demoror quisquam. Corrumpo adversus curvo deprimo celo sto.
Nam aegrus nemo solium vesco voluptas torrens temeritas stips acsi. Ventito sub adopto. Considero tantum cogo adsidue asper vulnero censura crastinus voluptas.', 'active', 1, 2, 15, '2024-04-28 16:16:17');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (50, 'Solum crudelis temporibus voro quo veritatis degusto.', 'Testimonium crux deinde communis. Arx admoveo reprehenderit vox adeptio amissio acer clam ducimus vulgo. Inflammatio tubineus curvo.
Assentator crebro patria caelestis degusto talio. Coadunatio animus subnecto sit vero accedo tersus peior. Aeger defessus temporibus tonsor arbor.
Laboriosam temperantia adduco qui arguo vitiosus. Cupiditate curatio possimus tremo crur desparatus tandem socius illo. Vix ulterius viduo tricesimus capitulus amitto amissio.', 'inactive', 1, 2, 6, '2024-05-22 10:22:36');

/* Categories */
INSERT INTO categories (id, title, description, creationAt) VALUES (1, 'arca', 'Voco aspernatur vesper asporto solium vorax bonus turba adsum.', '2024-07-15 03:50:46');
INSERT INTO categories (id, title, description, creationAt) VALUES (2, 'averto', 'Comburo vilis optio triduana ago depromo vel conforto circumvenio.', '2024-09-12 23:53:33');
INSERT INTO categories (id, title, description, creationAt) VALUES (3, 'bellum', 'Harum terminatio advenio tantum sed delicate aer tot ex quis.', '2024-09-25 22:53:32');
INSERT INTO categories (id, title, description, creationAt) VALUES (4, 'addo', 'Conicio textus vestigium clibanus vulgivagus subnecto thymbra crebro copia doloremque.', '2024-10-13 10:10:51');
INSERT INTO categories (id, title, description, creationAt) VALUES (5, 'surgo', 'Deputo substantia tondeo similique textor utroque.', '2024-01-31 09:49:19');
INSERT INTO categories (id, title, description, creationAt) VALUES (6, 'culpo', 'Victoria ademptio umquam verbera.', '2024-05-01 11:49:20');
INSERT INTO categories (id, title, description, creationAt) VALUES (7, 'voluptas', 'Video modi decumbo aperio balbus adnuo.', '2024-09-23 01:29:05');
INSERT INTO categories (id, title, description, creationAt) VALUES (8, 'denego', 'Peior paulatim certus.', '2024-09-16 00:10:31');

/* Post Categories */
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (1, 4, 3, '2024-04-08 21:53:06');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (2, 39, 6, '2024-07-21 18:09:04');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (3, 6, 7, '2024-07-31 04:58:59');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (4, 1, 4, '2024-06-17 12:35:55');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (5, 4, 4, '2024-01-08 17:33:06');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (6, 43, 2, '2024-08-20 07:56:18');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (7, 45, 1, '2024-01-21 10:20:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (8, 1, 1, '2024-05-29 00:40:49');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (9, 46, 7, '2024-04-25 16:14:31');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (10, 29, 6, '2024-06-25 07:35:38');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (11, 29, 2, '2024-01-09 00:53:08');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (12, 7, 4, '2024-01-28 09:31:29');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (13, 46, 8, '2024-06-14 06:48:25');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (14, 31, 3, '2024-02-28 00:20:00');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (15, 48, 3, '2024-09-14 12:32:07');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (16, 42, 4, '2024-07-29 03:08:49');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (17, 7, 7, '2024-01-24 01:39:35');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (18, 29, 8, '2024-01-26 00:09:45');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (19, 27, 8, '2024-04-18 08:22:50');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (20, 15, 4, '2024-04-14 22:58:50');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (21, 36, 3, '2024-01-18 04:49:14');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (22, 9, 7, '2024-07-28 07:33:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (23, 43, 1, '2024-07-26 00:23:28');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (24, 49, 5, '2024-08-22 19:39:52');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (25, 13, 2, '2024-01-16 08:39:56');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (26, 37, 2, '2024-06-01 01:34:49');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (27, 40, 5, '2024-08-24 19:06:06');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (28, 40, 2, '2024-04-03 00:55:00');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (30, 7, 6, '2024-07-17 19:29:57');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (31, 8, 5, '2024-02-02 14:23:40');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (32, 24, 2, '2024-04-15 08:46:33');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (33, 45, 6, '2024-08-29 06:17:45');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (34, 32, 5, '2024-01-05 18:51:01');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (36, 7, 5, '2024-06-11 04:55:22');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (37, 4, 8, '2024-07-08 15:31:44');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (38, 19, 2, '2024-06-27 12:56:09');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (39, 6, 6, '2024-08-04 11:50:39');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (40, 29, 3, '2024-06-09 02:24:39');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (41, 23, 7, '2024-01-07 15:28:24');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (42, 28, 1, '2024-02-19 11:07:33');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (43, 47, 6, '2024-04-01 13:30:12');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (44, 4, 1, '2024-01-09 16:35:30');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (45, 18, 8, '2024-01-17 02:25:09');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (46, 42, 3, '2024-08-19 11:04:53');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (47, 26, 1, '2024-05-14 14:08:03');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (49, 21, 3, '2024-01-06 07:33:20');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (50, 20, 7, '2024-02-24 01:13:08');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (52, 25, 1, '2024-09-02 16:16:47');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (53, 19, 5, '2024-05-29 09:58:06');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (54, 33, 8, '2024-06-12 01:22:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (55, 18, 6, '2024-04-14 14:53:59');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (56, 5, 1, '2024-06-28 22:56:53');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (57, 15, 1, '2024-09-24 06:01:05');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (58, 11, 6, '2024-06-25 16:51:32');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (59, 46, 1, '2024-03-18 06:38:18');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (60, 38, 6, '2024-09-19 03:44:53');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (61, 31, 6, '2024-09-27 08:17:57');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (62, 13, 8, '2024-04-09 07:34:23');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (63, 6, 3, '2024-02-07 04:29:02');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (64, 18, 7, '2024-07-23 14:16:17');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (65, 2, 2, '2024-03-30 20:21:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (66, 33, 2, '2024-02-13 06:34:54');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (67, 8, 3, '2024-05-18 03:08:20');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (68, 22, 4, '2024-07-13 03:01:25');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (70, 48, 2, '2024-01-09 08:00:44');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (72, 48, 5, '2024-09-09 11:02:34');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (73, 15, 2, '2024-04-25 02:54:41');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (74, 37, 6, '2024-09-06 13:04:13');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (76, 30, 2, '2024-07-27 10:42:27');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (77, 42, 2, '2024-03-18 16:32:43');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (78, 6, 8, '2024-09-27 06:38:32');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (79, 13, 7, '2024-08-10 16:35:45');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (81, 35, 4, '2024-09-01 05:03:48');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (82, 50, 4, '2024-02-29 23:24:02');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (83, 7, 2, '2024-08-07 16:25:43');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (84, 10, 7, '2024-08-08 14:08:25');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (85, 40, 3, '2024-06-05 13:36:00');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (87, 46, 5, '2024-02-17 03:50:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (89, 49, 8, '2024-02-01 23:33:55');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (90, 24, 5, '2024-02-08 00:44:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (91, 31, 1, '2024-04-05 05:51:04');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (95, 37, 1, '2024-06-30 02:29:24');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (96, 23, 3, '2024-01-30 10:26:12');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (97, 44, 5, '2024-04-15 11:50:41');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (100, 47, 8, '2024-08-19 03:31:47');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (101, 36, 1, '2024-06-29 01:54:38');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (102, 35, 5, '2024-06-13 19:39:13');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (103, 13, 3, '2024-03-30 02:26:47');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (104, 6, 1, '2024-03-30 15:05:32');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (105, 17, 4, '2024-07-18 05:48:41');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (106, 36, 5, '2024-04-22 02:23:14');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (107, 34, 2, '2024-09-11 04:49:52');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (108, 39, 3, '2024-08-17 15:25:38');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (109, 12, 5, '2024-03-10 11:42:16');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (110, 7, 1, '2024-05-19 12:07:24');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (111, 13, 6, '2024-02-05 12:40:50');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (112, 17, 1, '2024-10-03 02:50:54');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (114, 23, 1, '2024-03-13 00:13:38');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (116, 45, 3, '2024-10-15 00:14:30');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (117, 4, 7, '2024-10-05 22:28:58');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (118, 32, 4, '2024-02-18 13:03:32');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (120, 46, 6, '2024-02-22 10:35:35');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (121, 35, 3, '2024-06-25 05:11:57');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (122, 12, 3, '2024-02-15 19:20:52');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (123, 5, 5, '2024-01-25 12:52:22');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (124, 47, 2, '2024-03-05 16:15:35');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (125, 29, 1, '2024-02-16 01:02:40');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (126, 20, 8, '2024-03-30 00:17:58');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (127, 19, 8, '2024-08-23 15:11:52');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (128, 8, 6, '2024-07-14 02:36:07');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (130, 33, 7, '2024-03-21 13:18:11');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (131, 2, 6, '2024-02-07 10:28:53');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (132, 6, 4, '2024-01-07 06:42:08');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (133, 26, 3, '2024-02-05 03:47:46');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (134, 18, 3, '2024-03-18 02:05:11');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (135, 29, 4, '2024-09-21 00:10:25');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (136, 14, 6, '2024-08-29 18:38:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (137, 20, 3, '2024-09-11 06:08:27');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (138, 9, 1, '2024-05-02 23:10:33');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (139, 8, 2, '2024-05-22 13:08:47');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (140, 46, 3, '2024-08-22 05:54:50');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (141, 41, 2, '2024-07-28 16:10:29');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (142, 3, 3, '2024-08-10 12:21:26');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (144, 30, 8, '2024-03-04 12:04:55');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (146, 16, 2, '2024-04-04 17:39:44');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (147, 23, 5, '2024-06-12 22:30:23');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (150, 33, 5, '2024-01-18 15:33:04');

/* Post Favorites */
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (1, 6, 22, '2024-08-19 06:14:48');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (2, 11, 48, '2024-02-14 19:02:55');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (3, 6, 31, '2024-06-29 16:09:24');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (4, 13, 11, '2024-09-01 23:57:30');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (5, 9, 44, '2024-01-01 17:40:27');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (6, 12, 4, '2024-05-08 15:19:50');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (7, 13, 38, '2024-03-18 18:43:21');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (8, 10, 15, '2024-08-12 15:35:59');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (9, 3, 41, '2024-04-03 02:36:14');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (10, 1, 18, '2024-04-14 21:21:00');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (11, 13, 40, '2024-01-21 18:16:01');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (12, 14, 20, '2024-07-17 06:54:03');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (13, 11, 20, '2024-06-20 15:33:59');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (14, 6, 7, '2024-08-08 09:25:23');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (15, 15, 42, '2024-09-07 03:40:58');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (16, 1, 46, '2024-04-17 03:32:35');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (17, 8, 21, '2024-07-09 11:42:11');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (18, 14, 50, '2024-06-13 03:56:20');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (19, 1, 41, '2024-05-16 13:22:44');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (21, 10, 49, '2024-04-11 19:08:13');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (22, 4, 14, '2024-10-03 16:46:01');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (23, 9, 24, '2024-05-31 03:57:20');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (24, 2, 4, '2024-01-23 00:52:56');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (25, 3, 37, '2024-02-28 16:07:18');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (26, 14, 1, '2024-05-25 19:59:08');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (27, 2, 41, '2024-03-14 02:24:55');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (28, 1, 34, '2024-03-08 12:13:10');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (29, 13, 12, '2024-07-13 10:18:21');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (30, 3, 17, '2024-04-06 12:34:08');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (31, 13, 29, '2024-06-01 21:42:07');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (32, 15, 11, '2024-02-28 16:15:35');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (33, 12, 30, '2024-08-30 04:59:31');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (34, 15, 19, '2024-05-12 10:59:49');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (35, 13, 14, '2024-04-07 05:39:53');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (36, 5, 39, '2024-07-17 23:00:57');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (38, 1, 31, '2024-09-26 00:46:45');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (39, 8, 25, '2024-04-14 10:45:41');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (40, 10, 50, '2024-10-06 17:39:36');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (41, 8, 36, '2024-08-14 23:18:03');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (43, 1, 40, '2024-02-02 10:01:32');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (45, 12, 25, '2024-07-28 14:51:37');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (46, 2, 11, '2024-01-01 05:05:30');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (47, 1, 13, '2024-06-08 18:56:56');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (48, 6, 48, '2024-07-23 21:50:05');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (49, 3, 49, '2024-07-28 06:57:37');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (50, 13, 28, '2024-02-05 14:46:14');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (51, 3, 23, '2024-05-28 09:34:59');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (52, 1, 37, '2024-05-01 14:32:50');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (53, 2, 44, '2024-05-28 23:39:08');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (54, 15, 50, '2024-09-12 11:10:39');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (55, 8, 6, '2024-01-08 08:06:45');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (56, 6, 36, '2024-02-09 19:56:33');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (57, 6, 39, '2024-05-10 13:37:09');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (58, 4, 48, '2024-05-09 22:41:38');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (59, 5, 23, '2024-02-03 03:46:18');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (60, 15, 29, '2024-08-18 12:42:38');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (61, 7, 44, '2024-06-21 01:58:05');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (62, 3, 3, '2024-05-15 05:11:08');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (63, 11, 50, '2024-04-22 14:54:42');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (64, 13, 25, '2024-10-04 17:06:34');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (65, 10, 39, '2024-05-31 08:39:43');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (66, 3, 4, '2024-09-02 07:45:46');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (67, 9, 27, '2024-06-26 21:31:48');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (68, 3, 21, '2024-07-27 02:33:03');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (70, 7, 19, '2024-09-22 14:48:29');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (71, 15, 13, '2024-08-10 22:19:05');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (72, 7, 37, '2024-02-10 19:10:59');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (73, 9, 20, '2024-04-18 12:09:53');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (74, 1, 2, '2024-04-19 22:20:59');

/* Comments */
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (1, 9, 13, 'Timor cras delectatio tertius similique vivo terminatio adulescens.', 0, 'active', '2024-10-09 04:44:14');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (2, 43, 7, 'Delinquo demitto celebrer suscipio denego umerus omnis.', 0, 'inactive', '2024-02-20 21:23:58');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (3, 19, 13, 'Tutamen sui pecto veritas tristis combibo constans cunctatio quisquam.', 0, 'active', '2024-07-27 00:33:03');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (4, 3, 9, 'Claustrum vitae spoliatio demum surgo vesica asporto.', 0, 'active', '2024-08-26 11:27:44');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (5, 45, 6, 'Adversus suscipit aeger thymum vulariter stillicidium pectus.', 0, 'inactive', '2024-03-22 16:22:51');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (6, 13, 15, 'Desparatus cena vigilo sono vinitor tondeo uter cubicularis absque.', 0, 'active', '2024-09-28 00:34:03');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (7, 6, 9, 'Consectetur synagoga vergo super sint vox ante saepe magnam.', 0, 'inactive', '2024-05-31 01:49:33');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (8, 28, 4, 'Ager somnus acervus decerno collum.', 0, 'active', '2024-05-31 16:07:48');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (9, 4, 7, 'Defessus adimpleo dolor angelus totidem id clam tergum.', 0, 'inactive', '2024-09-03 04:51:12');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (10, 33, 7, 'Corporis convoco cena civis copiose.', 0, 'active', '2024-07-16 18:07:40');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (11, 1, 6, 'Suppellex surgo laboriosam thema expedita vado sapiente auxilium vilitas eveniet.', 0, 'inactive', '2024-05-19 23:05:40');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (12, 8, 3, 'Caveo creptio voluptatum ventosus tot.', 0, 'active', '2024-03-11 21:21:52');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (13, 21, 10, 'Peior contra tamisium capillus vito aureus utrum rem.', 0, 'active', '2024-01-22 02:31:00');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (14, 39, 13, 'Concedo dedecor canonicus auditor ait voluptas reiciendis.', 0, 'active', '2024-02-11 17:03:23');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (15, 18, 11, 'Accommodo trepide conicio stabilis abeo caecus altus allatus.', 0, 'active', '2024-05-19 01:35:29');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (16, 11, 14, 'Spargo dolores accommodo patruus cruciamentum corroboro bardus spargo.', 0, 'inactive', '2024-02-24 05:49:38');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (17, 18, 10, 'Demum vergo compello barba eveniet fuga suffragium.', 0, 'active', '2024-03-21 13:14:32');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (18, 39, 5, 'Vorax tamquam brevis adsum summisse temperantia.', 0, 'active', '2024-04-17 05:13:52');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (19, 41, 13, 'Accusantium tumultus cetera summopere aggredior turbo benigne dapifer vehemens.', 0, 'inactive', '2024-04-02 19:37:54');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (20, 24, 3, 'Voluptates ulterius adficio spiritus corpus aut alius tripudio audentia.', 0, 'active', '2024-08-13 18:49:06');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (21, 3, 8, 'Conqueror deputo peccatus soleo copia sublime.', 0, 'active', '2024-09-02 23:32:02');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (22, 47, 10, 'Deleo arbor adhuc tamisium.', 0, 'inactive', '2024-01-22 03:35:13');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (23, 9, 2, 'Qui aureus cohibeo carbo vacuus vehemens cuius cupio defungo autus.', 0, 'inactive', '2024-04-23 17:43:17');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (24, 50, 3, 'Acervus apostolus corpus.', 0, 'active', '2024-09-22 17:24:30');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (25, 47, 6, 'Thymbra ultra aegre viscus suppono libero architecto.', 0, 'active', '2024-03-04 07:40:24');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (26, 49, 13, 'Crinis solum demoror candidus quidem benigne patior.', 0, 'active', '2024-03-11 19:38:22');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (27, 16, 6, 'Aspernatur triumphus deleniti tricesimus auditor umquam esse accommodo video.', 0, 'active', '2024-07-14 17:33:27');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (28, 44, 2, 'Crux turpis tego delectatio casus tenus deleo.', 0, 'active', '2024-01-27 09:16:57');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (29, 1, 2, 'Nulla cernuus coniuratio adnuo error.', 0, 'inactive', '2024-10-05 00:37:22');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (30, 20, 6, 'Benigne victus tepesco dedecor venustas approbo ter tui quia adhuc.', 0, 'active', '2024-07-02 07:16:23');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (31, 20, 11, 'Demo statim adinventitias corrigo nesciunt.', 0, 'active', '2024-04-14 09:43:40');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (32, 4, 9, 'Dens usque vereor suffoco demum carmen supra ullam.', 0, 'inactive', '2024-02-17 08:03:05');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (33, 4, 9, 'Ipsa vitiosus versus iure aequitas anser.', 0, 'active', '2024-02-09 17:04:05');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (34, 41, 13, 'Acquiro acquiro nisi adulescens velociter video deludo.', 0, 'inactive', '2024-04-03 01:33:42');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (35, 45, 2, 'Canonicus conor decimus torrens ex thymum denuo pauci volo velociter.', 0, 'active', '2024-08-12 01:14:24');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (36, 23, 12, 'Beneficium benevolentia deleniti.', 0, 'inactive', '2024-06-21 12:50:30');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (37, 9, 5, 'Canonicus delego ago suppono mollitia.', 0, 'active', '2024-05-02 07:01:29');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (38, 38, 3, 'Urbanus avarus magni cito confugo aureus earum.', 0, 'inactive', '2024-01-19 09:45:39');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (39, 27, 1, 'Ullus possimus quae facilis termes tamisium quis defaeco.', 0, 'inactive', '2024-05-24 11:52:50');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (40, 28, 12, 'Tyrannus cometes abbas pecus tamisium umerus spes.', 0, 'active', '2024-09-29 18:05:58');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (41, 45, 15, 'Confugo tenus sunt abutor decor.', 0, 'active', '2024-08-23 22:31:47');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (42, 42, 8, 'Assumenda torqueo dedecor appositus voluptate.', 0, 'active', '2024-06-19 04:35:10');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (43, 12, 6, 'Tondeo acervus cibo cimentarius acervus.', 0, 'active', '2024-02-29 07:34:12');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (44, 34, 14, 'Cupio caries ventosus angulus.', 0, 'active', '2024-09-07 22:29:06');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (45, 3, 8, 'Sequi decet usus cuius aduro cupiditas confido molestiae.', 0, 'inactive', '2024-03-29 02:31:48');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (46, 29, 12, 'Temporibus teneo defaeco cras admitto ustilo cauda decretum acer arceo.', 0, 'inactive', '2024-08-29 18:31:26');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (47, 24, 11, 'Attonbitus voveo concido sui adnuo cumque.', 0, 'inactive', '2024-01-22 18:52:51');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (48, 49, 4, 'Nulla surgo charisma.', 0, 'active', '2024-03-28 19:44:00');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (49, 9, 5, 'Suadeo damnatio adfectus patior.', 0, 'active', '2024-01-08 14:20:49');
INSERT INTO comments (id, postId, creationById, content, isHelpful, status, creationAt) VALUES (50, 45, 13, 'Addo vitium uberrime cinis vulgus crinis demens damno candidus strenuus.', 0, 'active', '2024-07-07 04:14:10');

/* Likes */
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (1, 8, 21, null, 'dislike', '2024-07-22 18:06:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (2, 5, 3, null, 'dislike', '2024-09-28 05:10:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (3, 9, 22, null, 'like', '2024-06-01 19:26:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (4, 4, 33, null, 'like', '2024-07-09 01:46:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5, 13, 37, null, 'dislike', '2024-07-01 18:13:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6, 10, 32, null, 'like', '2024-02-25 04:37:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (7, 3, 36, null, 'like', '2024-05-05 03:53:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (8, 15, 22, null, 'dislike', '2024-08-10 11:24:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (9, 2, 21, null, 'like', '2024-04-09 10:33:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (10, 7, 15, null, 'like', '2024-04-16 08:05:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (12, 3, 41, null, 'dislike', '2024-06-19 21:49:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (13, 11, 16, null, 'like', '2024-04-29 05:58:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (14, 2, 25, null, 'like', '2024-09-07 14:14:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (15, 2, 43, null, 'dislike', '2024-05-30 09:33:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (16, 7, 13, null, 'dislike', '2024-10-08 12:33:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (17, 15, 40, null, 'dislike', '2024-06-26 17:47:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (18, 13, 20, null, 'dislike', '2024-09-16 19:40:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (19, 7, 45, null, 'dislike', '2024-09-21 11:15:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (20, 15, 33, null, 'dislike', '2024-08-04 04:16:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (21, 11, 42, null, 'like', '2024-04-15 12:07:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (22, 11, 23, null, 'dislike', '2024-09-13 20:04:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (23, 7, 42, null, 'like', '2024-03-17 09:07:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (24, 9, 33, null, 'like', '2024-02-21 09:19:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (25, 6, 29, null, 'dislike', '2024-04-09 19:05:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (26, 10, 24, null, 'dislike', '2024-08-10 12:19:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (27, 3, 26, null, 'dislike', '2024-02-23 16:55:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (28, 5, 37, null, 'like', '2024-08-09 20:56:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (29, 1, 44, null, 'dislike', '2024-07-15 01:05:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (30, 11, 9, null, 'like', '2024-03-23 09:14:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (31, 8, 46, null, 'like', '2024-04-26 02:37:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (33, 15, 21, null, 'dislike', '2024-02-05 08:27:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (34, 6, 26, null, 'like', '2024-06-21 14:46:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (35, 6, 5, null, 'like', '2024-03-07 16:54:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (36, 9, 44, null, 'dislike', '2024-04-03 08:24:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (37, 4, 10, null, 'dislike', '2024-10-12 05:30:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (38, 4, 26, null, 'dislike', '2024-09-13 11:00:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (39, 2, 31, null, 'like', '2024-03-05 13:28:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (40, 9, 3, null, 'dislike', '2024-08-23 05:04:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (41, 3, 38, null, 'like', '2024-04-06 01:09:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (42, 13, 27, null, 'like', '2024-03-31 23:45:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (44, 7, 3, null, 'like', '2024-08-18 22:47:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45, 9, 15, null, 'like', '2024-07-02 02:02:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (46, 8, 18, null, 'like', '2024-01-14 03:26:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (47, 6, 31, null, 'like', '2024-07-10 15:50:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (48, 10, 14, null, 'dislike', '2024-04-08 01:55:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (49, 11, 50, null, 'dislike', '2024-01-26 21:48:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (50, 6, 39, null, 'dislike', '2024-03-18 20:40:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (51, 3, null, 2, 'dislike', '2024-03-28 21:45:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (52, 6, null, 23, 'like', '2024-04-22 09:00:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (53, 8, null, 10, 'dislike', '2024-02-11 21:10:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (54, 10, null, 46, 'dislike', '2024-06-09 01:04:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (55, 8, null, 9, 'dislike', '2024-05-19 17:07:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (56, 1, null, 8, 'dislike', '2024-01-21 16:40:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (57, 14, null, 42, 'dislike', '2024-03-15 14:09:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (58, 8, null, 31, 'dislike', '2024-01-05 21:49:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (59, 11, null, 48, 'like', '2024-10-14 07:46:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (60, 12, null, 19, 'like', '2024-08-25 15:42:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (61, 12, null, 6, 'dislike', '2024-06-13 16:58:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (62, 7, null, 16, 'dislike', '2024-05-23 21:13:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (63, 11, null, 35, 'like', '2024-03-04 15:32:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (64, 11, null, 45, 'like', '2024-01-09 09:34:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (65, 12, null, 13, 'like', '2024-08-04 12:33:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (66, 13, null, 21, 'dislike', '2024-03-31 21:56:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (67, 2, null, 4, 'dislike', '2024-08-12 01:42:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (68, 9, null, 40, 'like', '2024-01-31 06:30:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (69, 10, null, 47, 'dislike', '2024-01-26 01:43:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (70, 3, null, 48, 'like', '2024-03-09 00:38:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (71, 8, null, 40, 'like', '2024-08-22 08:15:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (72, 11, null, 10, 'dislike', '2024-07-23 05:14:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (73, 2, null, 43, 'dislike', '2024-02-14 18:59:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (74, 3, null, 36, 'like', '2024-04-29 02:37:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (75, 1, null, 33, 'like', '2024-05-17 23:44:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (77, 3, null, 14, 'like', '2024-06-27 15:43:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (78, 8, null, 32, 'like', '2024-02-10 17:57:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (79, 1, null, 19, 'like', '2024-07-30 01:55:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (80, 11, null, 30, 'like', '2024-07-03 15:33:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (81, 10, null, 25, 'dislike', '2024-04-04 14:02:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (82, 7, null, 11, 'dislike', '2024-07-01 00:44:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (83, 12, null, 10, 'dislike', '2024-03-21 18:26:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (84, 10, null, 34, 'like', '2024-06-23 16:30:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (85, 9, null, 36, 'dislike', '2024-05-12 17:05:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (86, 7, null, 4, 'like', '2024-04-04 20:37:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (87, 3, null, 22, 'dislike', '2024-02-24 06:23:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (88, 9, null, 15, 'like', '2024-05-31 12:45:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (89, 13, null, 23, 'dislike', '2024-06-03 19:59:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (90, 7, null, 39, 'like', '2024-08-21 20:19:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (91, 12, null, 42, 'like', '2024-04-06 14:22:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (92, 7, null, 9, 'dislike', '2024-02-11 04:46:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (93, 15, null, 29, 'dislike', '2024-06-23 06:33:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (94, 9, null, 16, 'dislike', '2024-10-14 20:08:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (95, 14, null, 7, 'like', '2024-09-19 00:58:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (96, 7, null, 40, 'dislike', '2024-04-27 11:02:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (97, 10, null, 27, 'like', '2024-01-20 09:17:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (98, 14, null, 40, 'like', '2024-09-28 03:09:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (99, 12, null, 1, 'dislike', '2024-01-22 14:50:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (100, 9, null, 30, 'dislike', '2024-08-23 11:02:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (101, 10, 8, null, 'like', '2024-05-23 01:21:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (102, 9, 12, null, 'dislike', '2024-08-20 19:48:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (104, 10, 27, null, 'dislike', '2024-05-29 15:00:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (105, 6, 20, null, 'like', '2024-07-11 19:39:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (106, 12, 13, null, 'dislike', '2024-01-25 10:25:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (107, 2, 2, null, 'like', '2024-09-18 11:54:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (108, 7, 33, null, 'like', '2024-04-14 20:47:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (109, 14, 32, null, 'dislike', '2024-06-25 01:59:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (110, 10, 37, null, 'like', '2024-06-18 14:47:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (111, 15, 32, null, 'dislike', '2024-03-05 05:09:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (112, 4, 6, null, 'dislike', '2024-02-06 16:25:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (113, 11, 39, null, 'dislike', '2024-08-07 17:12:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (114, 5, 38, null, 'dislike', '2024-03-02 09:52:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (115, 14, 45, null, 'like', '2024-07-23 23:35:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (116, 7, 20, null, 'dislike', '2024-08-29 10:25:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (117, 9, 19, null, 'dislike', '2024-08-02 06:52:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (118, 14, 28, null, 'like', '2024-04-11 23:36:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (119, 11, 30, null, 'dislike', '2024-06-23 10:33:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (120, 15, 41, null, 'dislike', '2024-07-07 04:52:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (122, 5, 47, null, 'dislike', '2024-04-16 08:50:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (123, 1, 21, null, 'like', '2024-03-13 07:16:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (124, 10, 35, null, 'dislike', '2024-08-20 23:17:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (125, 6, 38, null, 'like', '2024-01-08 06:59:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (126, 11, 17, null, 'like', '2024-02-09 11:49:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (127, 10, 9, null, 'dislike', '2024-05-14 15:58:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (128, 2, 5, null, 'dislike', '2024-01-01 15:54:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (129, 6, 40, null, 'like', '2024-06-20 13:22:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (130, 12, 20, null, 'dislike', '2024-07-31 06:22:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (131, 11, 3, null, 'like', '2024-02-07 03:51:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (132, 6, 36, null, 'like', '2024-02-11 12:57:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (133, 12, 5, null, 'like', '2024-03-24 04:16:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (134, 10, 16, null, 'like', '2024-09-27 15:09:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (135, 4, 48, null, 'like', '2024-09-14 00:56:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (136, 5, 34, null, 'like', '2024-08-22 12:37:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (137, 3, 12, null, 'like', '2024-05-10 20:35:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (138, 1, 36, null, 'like', '2024-07-06 09:21:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (139, 11, 11, null, 'dislike', '2024-06-03 14:40:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (140, 14, 40, null, 'dislike', '2024-07-14 16:15:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (141, 8, 1, null, 'like', '2024-05-09 08:08:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (142, 11, 35, null, 'like', '2024-08-04 18:09:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (143, 5, 46, null, 'like', '2024-08-20 19:22:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (144, 12, 33, null, 'like', '2024-09-24 02:49:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (145, 15, 11, null, 'like', '2024-05-11 19:26:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (146, 7, 28, null, 'like', '2024-09-29 08:25:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (147, 2, 42, null, 'like', '2024-04-03 19:39:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (148, 13, 36, null, 'dislike', '2024-07-01 00:47:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (149, 7, 37, null, 'like', '2024-06-20 21:00:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (150, 12, 27, null, 'dislike', '2024-06-10 02:55:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (151, 12, null, 35, 'dislike', '2024-07-08 05:26:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (152, 6, null, 50, 'dislike', '2024-05-17 18:09:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (153, 14, null, 27, 'dislike', '2024-03-30 03:49:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (154, 1, null, 50, 'like', '2024-04-05 07:04:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (155, 2, null, 18, 'dislike', '2024-02-14 04:43:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (156, 2, null, 33, 'dislike', '2024-02-18 04:25:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (157, 13, null, 16, 'like', '2024-03-13 11:42:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (158, 9, null, 49, 'like', '2024-08-02 04:32:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (159, 1, null, 13, 'like', '2024-08-22 20:34:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (161, 2, null, 41, 'dislike', '2024-10-14 23:27:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (163, 3, null, 28, 'like', '2024-08-03 13:06:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (164, 5, null, 15, 'like', '2024-02-25 06:38:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (165, 1, null, 27, 'like', '2024-02-04 20:04:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (166, 4, null, 33, 'dislike', '2024-01-01 12:52:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (167, 14, null, 19, 'like', '2024-09-05 15:03:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (168, 2, null, 16, 'dislike', '2024-07-19 22:51:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (169, 1, null, 47, 'like', '2024-05-10 12:43:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (170, 13, null, 17, 'like', '2024-02-05 05:29:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (171, 13, null, 24, 'dislike', '2024-04-03 00:21:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (172, 6, null, 6, 'like', '2024-09-22 13:08:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (174, 2, null, 3, 'like', '2024-06-28 08:49:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (175, 6, null, 35, 'like', '2024-04-24 09:37:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (176, 5, null, 27, 'dislike', '2024-03-29 21:09:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (178, 8, null, 41, 'dislike', '2024-06-08 01:48:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (180, 10, null, 41, 'dislike', '2024-05-24 04:18:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (181, 5, null, 40, 'like', '2024-05-08 05:56:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (182, 8, null, 28, 'dislike', '2024-05-06 19:57:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (183, 15, null, 50, 'dislike', '2024-06-05 10:07:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (184, 2, null, 26, 'like', '2024-08-08 13:34:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (185, 10, null, 35, 'dislike', '2024-07-06 09:13:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (186, 8, null, 13, 'like', '2024-07-03 09:22:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (188, 7, null, 41, 'dislike', '2024-07-26 23:34:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (189, 5, null, 42, 'dislike', '2024-01-07 08:15:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (190, 11, null, 21, 'dislike', '2024-03-13 22:55:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (191, 8, null, 33, 'dislike', '2024-08-13 21:33:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (192, 4, null, 22, 'dislike', '2024-08-25 04:40:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (193, 7, null, 33, 'dislike', '2024-09-24 20:53:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (194, 5, null, 31, 'like', '2024-03-14 04:17:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (195, 9, null, 20, 'dislike', '2024-07-03 12:28:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (196, 11, null, 36, 'like', '2024-10-04 04:01:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (197, 3, null, 42, 'dislike', '2024-05-22 13:37:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (198, 6, null, 49, 'dislike', '2024-04-14 10:44:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (199, 12, null, 18, 'dislike', '2024-10-06 15:56:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (200, 6, null, 28, 'like', '2024-10-04 02:34:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (201, 13, 40, null, 'like', '2024-03-21 15:58:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (203, 12, 29, null, 'like', '2024-06-25 00:02:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (204, 13, 8, null, 'like', '2024-06-13 17:10:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (205, 9, 4, null, 'dislike', '2024-02-28 22:25:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (206, 3, 30, null, 'like', '2024-07-06 00:38:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (208, 6, 3, null, 'dislike', '2024-07-20 17:35:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (209, 6, 13, null, 'dislike', '2024-07-20 19:31:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (210, 15, 9, null, 'dislike', '2024-08-03 00:39:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (211, 10, 7, null, 'like', '2024-06-09 02:23:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (212, 12, 50, null, 'dislike', '2024-02-06 03:42:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (213, 12, 24, null, 'like', '2024-06-14 15:50:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (214, 11, 37, null, 'like', '2024-04-19 22:15:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (215, 8, 2, null, 'like', '2024-09-26 13:23:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (216, 7, 26, null, 'like', '2024-01-23 17:41:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (217, 14, 38, null, 'dislike', '2024-03-18 19:21:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (218, 13, 9, null, 'like', '2024-04-13 22:28:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (219, 10, 38, null, 'like', '2024-02-28 04:45:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (220, 9, 5, null, 'like', '2024-03-14 03:53:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (221, 13, 46, null, 'dislike', '2024-03-14 15:21:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (222, 4, 7, null, 'like', '2024-02-22 18:15:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (223, 1, 39, null, 'dislike', '2024-09-22 02:41:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (224, 11, 21, null, 'like', '2024-09-22 18:45:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (225, 6, 32, null, 'like', '2024-02-03 22:21:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (226, 7, 46, null, 'dislike', '2024-09-09 07:53:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (227, 1, 18, null, 'like', '2024-01-15 04:08:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (228, 1, 2, null, 'like', '2024-08-29 20:58:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (229, 7, 21, null, 'dislike', '2024-07-08 02:42:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (230, 15, 26, null, 'like', '2024-04-07 06:21:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (231, 4, 34, null, 'dislike', '2024-02-27 08:02:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (232, 7, 16, null, 'dislike', '2024-06-15 03:19:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (235, 9, 39, null, 'dislike', '2024-05-12 15:39:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (236, 13, 47, null, 'dislike', '2024-02-09 21:04:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (237, 12, 38, null, 'like', '2024-03-15 12:50:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (238, 9, 21, null, 'dislike', '2024-09-19 08:14:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (239, 5, 23, null, 'dislike', '2024-07-09 07:33:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (240, 4, 31, null, 'dislike', '2024-06-06 14:18:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (241, 8, 45, null, 'dislike', '2024-02-18 10:14:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (242, 11, 1, null, 'dislike', '2024-01-16 21:48:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (243, 5, 44, null, 'dislike', '2024-03-12 05:31:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (245, 2, 15, null, 'like', '2024-01-12 06:26:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (246, 3, 27, null, 'dislike', '2024-07-23 07:07:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (248, 3, 25, null, 'like', '2024-08-30 04:27:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (249, 3, 11, null, 'like', '2024-02-05 03:05:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (251, 5, null, 26, 'dislike', '2024-06-04 02:21:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (252, 5, null, 33, 'like', '2024-07-10 05:50:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (253, 15, null, 14, 'like', '2024-05-09 04:22:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (254, 14, null, 21, 'like', '2024-09-18 02:17:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (255, 8, null, 35, 'like', '2024-10-02 07:50:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (257, 5, null, 39, 'like', '2024-05-22 12:17:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (258, 4, null, 29, 'like', '2024-09-11 22:33:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (259, 15, null, 46, 'dislike', '2024-08-30 00:28:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (260, 11, null, 20, 'dislike', '2024-06-21 01:33:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (263, 8, null, 20, 'dislike', '2024-06-03 17:32:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (264, 1, null, 43, 'like', '2024-09-07 16:59:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (266, 7, null, 12, 'like', '2024-04-02 22:37:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (269, 8, null, 6, 'dislike', '2024-07-22 13:47:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (270, 1, null, 37, 'like', '2024-05-20 06:37:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (271, 15, null, 19, 'like', '2024-07-21 21:13:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (272, 2, null, 31, 'like', '2024-04-11 11:02:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (273, 12, null, 14, 'dislike', '2024-02-14 09:44:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (274, 1, null, 40, 'like', '2024-04-16 20:33:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (275, 9, null, 28, 'like', '2024-01-04 05:53:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (276, 5, null, 29, 'like', '2024-03-28 18:06:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (277, 13, null, 25, 'dislike', '2024-03-11 07:24:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (279, 11, null, 2, 'dislike', '2024-09-04 01:48:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (280, 1, null, 22, 'like', '2024-05-23 02:01:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (281, 7, null, 15, 'dislike', '2024-03-29 06:33:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (282, 9, null, 23, 'dislike', '2024-04-05 16:54:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (283, 4, null, 30, 'dislike', '2024-03-14 19:42:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (284, 6, null, 15, 'dislike', '2024-09-11 20:26:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (285, 6, null, 11, 'like', '2024-07-03 15:08:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (286, 7, null, 6, 'dislike', '2024-08-03 20:26:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (287, 2, null, 48, 'like', '2024-05-28 01:57:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (288, 3, null, 37, 'dislike', '2024-08-02 17:20:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (289, 5, null, 32, 'dislike', '2024-03-27 13:38:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (291, 3, null, 15, 'like', '2024-02-13 20:41:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (292, 14, null, 37, 'dislike', '2024-10-06 13:40:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (293, 12, null, 40, 'like', '2024-03-28 13:42:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (294, 8, null, 30, 'like', '2024-07-05 09:14:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (295, 9, null, 4, 'dislike', '2024-10-06 22:43:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (296, 3, null, 18, 'dislike', '2024-04-01 11:37:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (297, 12, null, 4, 'dislike', '2024-02-11 02:06:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (298, 6, null, 27, 'dislike', '2024-09-05 11:20:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (299, 13, null, 26, 'like', '2024-04-05 16:50:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (300, 12, null, 15, 'dislike', '2024-07-27 02:04:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (301, 6, 11, null, 'like', '2024-01-06 22:45:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (303, 3, 3, null, 'dislike', '2024-03-09 16:59:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (304, 12, 49, null, 'dislike', '2024-10-04 04:49:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (305, 10, 5, null, 'like', '2024-03-05 02:15:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (306, 9, 28, null, 'like', '2024-03-18 16:41:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (307, 14, 49, null, 'like', '2024-09-12 20:07:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (308, 15, 48, null, 'dislike', '2024-09-12 12:56:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (309, 3, 32, null, 'dislike', '2024-02-09 22:14:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (310, 4, 8, null, 'dislike', '2024-02-03 04:27:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (311, 8, 19, null, 'dislike', '2024-04-04 16:00:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (312, 14, 23, null, 'like', '2024-04-14 10:53:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (313, 3, 7, null, 'dislike', '2024-08-10 14:29:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (314, 9, 17, null, 'like', '2024-08-30 11:17:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (315, 4, 41, null, 'dislike', '2024-01-28 08:42:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (316, 2, 50, null, 'dislike', '2024-04-24 04:55:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (317, 9, 25, null, 'dislike', '2024-08-31 12:48:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (318, 5, 39, null, 'dislike', '2024-03-25 18:37:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (319, 10, 20, null, 'like', '2024-02-08 03:37:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (320, 14, 16, null, 'like', '2024-09-01 15:18:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (321, 9, 35, null, 'dislike', '2024-09-05 20:17:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (323, 1, 43, null, 'like', '2024-06-17 00:58:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (324, 10, 39, null, 'dislike', '2024-02-03 08:41:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (325, 11, 20, null, 'dislike', '2024-05-10 11:24:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (326, 6, 14, null, 'like', '2024-07-29 02:57:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (327, 1, 34, null, 'like', '2024-07-05 19:21:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (328, 2, 3, null, 'dislike', '2024-06-02 10:52:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (329, 10, 11, null, 'like', '2024-01-07 17:18:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (330, 6, 37, null, 'like', '2024-06-05 01:15:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (332, 14, 41, null, 'like', '2024-04-19 17:43:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (333, 7, 50, null, 'like', '2024-09-12 08:43:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (334, 4, 25, null, 'dislike', '2024-05-08 08:05:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (335, 10, 34, null, 'like', '2024-04-04 14:41:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (336, 11, 36, null, 'dislike', '2024-04-15 21:22:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (337, 8, 34, null, 'like', '2024-06-26 16:13:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (338, 2, 28, null, 'dislike', '2024-01-29 04:18:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (339, 14, 30, null, 'dislike', '2024-01-10 21:28:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (340, 15, 30, null, 'dislike', '2024-03-12 09:02:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (342, 9, 32, null, 'dislike', '2024-01-11 15:43:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (343, 13, 18, null, 'dislike', '2024-05-19 03:31:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (344, 1, 6, null, 'dislike', '2024-03-14 16:17:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (346, 12, 22, null, 'like', '2024-07-02 11:00:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (347, 4, 16, null, 'dislike', '2024-06-23 17:29:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (348, 11, 28, null, 'like', '2024-05-25 10:44:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (349, 9, 23, null, 'dislike', '2024-07-16 17:45:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (350, 12, 1, null, 'like', '2024-07-10 20:39:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (351, 1, null, 38, 'dislike', '2024-08-26 17:57:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (352, 7, null, 21, 'dislike', '2024-04-02 01:09:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (353, 8, null, 24, 'like', '2024-02-05 22:56:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (354, 13, null, 42, 'dislike', '2024-08-28 11:23:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (355, 6, null, 33, 'like', '2024-10-12 14:56:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (356, 9, null, 27, 'dislike', '2024-04-30 21:06:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (357, 12, null, 46, 'dislike', '2024-09-09 13:16:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (359, 11, null, 13, 'dislike', '2024-10-06 16:46:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (360, 2, null, 35, 'like', '2024-10-01 13:09:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (362, 5, null, 24, 'like', '2024-03-22 03:10:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (363, 14, null, 31, 'dislike', '2024-05-20 10:20:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (364, 6, null, 31, 'dislike', '2024-06-22 01:50:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (366, 1, null, 12, 'dislike', '2024-05-06 09:46:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (368, 11, null, 50, 'dislike', '2024-06-02 14:38:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (371, 2, null, 30, 'dislike', '2024-06-11 14:52:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (373, 6, null, 39, 'like', '2024-07-24 07:48:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (374, 8, null, 16, 'dislike', '2024-08-01 15:41:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (377, 6, null, 42, 'dislike', '2024-08-07 15:49:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (378, 11, null, 42, 'like', '2024-06-22 17:10:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (380, 11, null, 28, 'like', '2024-02-09 12:09:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (381, 11, null, 29, 'like', '2024-04-11 06:18:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (382, 14, null, 26, 'dislike', '2024-04-11 19:41:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (384, 3, null, 3, 'like', '2024-02-01 20:07:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (385, 6, null, 9, 'like', '2024-10-07 16:29:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (387, 7, null, 43, 'like', '2024-05-19 13:33:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (388, 7, null, 27, 'like', '2024-08-22 21:31:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (389, 10, null, 19, 'like', '2024-03-13 08:52:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (390, 11, null, 22, 'dislike', '2024-03-24 10:19:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (392, 14, null, 22, 'dislike', '2024-03-12 00:35:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (393, 12, null, 21, 'dislike', '2024-06-22 17:54:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (394, 13, null, 18, 'dislike', '2024-05-03 10:37:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (395, 4, null, 4, 'dislike', '2024-09-07 08:44:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (397, 8, null, 38, 'dislike', '2024-10-01 19:17:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (399, 6, null, 3, 'dislike', '2024-06-15 10:09:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (400, 1, null, 7, 'like', '2024-09-25 09:36:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (401, 7, 29, null, 'dislike', '2024-04-06 04:05:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (402, 7, 19, null, 'dislike', '2024-09-01 21:04:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (403, 14, 26, null, 'like', '2024-02-17 10:11:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (405, 12, 7, null, 'dislike', '2024-05-29 08:15:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (406, 3, 43, null, 'like', '2024-10-11 07:01:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (408, 7, 23, null, 'dislike', '2024-08-07 11:13:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (409, 12, 12, null, 'dislike', '2024-10-06 03:58:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (410, 1, 10, null, 'like', '2024-04-18 01:48:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (411, 7, 31, null, 'like', '2024-08-27 02:45:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (412, 13, 6, null, 'dislike', '2024-09-24 07:58:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (414, 4, 36, null, 'dislike', '2024-04-05 13:03:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (416, 4, 19, null, 'dislike', '2024-10-09 08:17:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (418, 3, 13, null, 'like', '2024-08-30 12:47:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (420, 7, 22, null, 'dislike', '2024-03-10 05:14:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (422, 15, 2, null, 'like', '2024-02-27 03:08:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (423, 7, 5, null, 'like', '2024-04-17 00:30:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (425, 2, 29, null, 'dislike', '2024-04-19 08:18:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (426, 6, 27, null, 'dislike', '2024-09-02 14:28:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (427, 9, 16, null, 'like', '2024-06-05 07:55:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (428, 1, 11, null, 'like', '2024-06-26 22:54:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (429, 2, 44, null, 'dislike', '2024-05-04 23:01:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (430, 5, 6, null, 'dislike', '2024-01-11 18:17:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (431, 5, 29, null, 'like', '2024-08-27 17:42:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (433, 11, 46, null, 'dislike', '2024-07-19 13:48:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (434, 2, 10, null, 'like', '2024-03-28 09:32:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (435, 1, 49, null, 'dislike', '2024-04-02 18:19:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (436, 7, 1, null, 'dislike', '2024-09-27 09:59:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (437, 2, 7, null, 'like', '2024-02-04 15:15:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (440, 11, 48, null, 'like', '2024-08-31 02:44:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (442, 7, 49, null, 'like', '2024-09-20 09:32:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (443, 6, 1, null, 'dislike', '2024-02-09 23:30:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (445, 1, 42, null, 'like', '2024-07-25 05:02:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (448, 12, 6, null, 'like', '2024-07-04 21:49:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (449, 7, 30, null, 'like', '2024-06-18 23:34:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (450, 12, 8, null, 'like', '2024-05-11 20:06:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (451, 2, null, 7, 'like', '2024-01-08 05:58:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (452, 15, null, 18, 'like', '2024-02-06 16:51:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (455, 4, null, 7, 'dislike', '2024-01-09 11:18:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (456, 7, null, 13, 'like', '2024-05-17 04:46:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (457, 14, null, 12, 'like', '2024-07-31 19:41:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (458, 2, null, 40, 'dislike', '2024-10-10 09:08:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (459, 9, null, 17, 'like', '2024-08-24 01:57:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (460, 3, null, 47, 'dislike', '2024-07-06 21:02:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (461, 6, null, 34, 'dislike', '2024-06-07 01:33:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (462, 14, null, 5, 'dislike', '2024-08-29 14:51:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (463, 13, null, 6, 'like', '2024-06-06 22:49:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (465, 3, null, 19, 'dislike', '2024-10-08 10:27:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (466, 13, null, 13, 'like', '2024-03-21 01:32:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (467, 14, null, 10, 'dislike', '2024-05-01 20:31:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (469, 7, null, 20, 'dislike', '2024-04-13 00:07:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (471, 10, null, 17, 'dislike', '2024-10-12 04:14:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (473, 10, null, 30, 'dislike', '2024-09-27 20:58:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (474, 3, null, 39, 'dislike', '2024-01-05 03:40:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (475, 7, null, 38, 'like', '2024-06-26 14:32:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (476, 13, null, 19, 'like', '2024-02-23 18:36:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (477, 10, null, 8, 'like', '2024-08-04 00:06:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (478, 9, null, 12, 'like', '2024-02-26 04:21:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (479, 15, null, 3, 'dislike', '2024-04-17 09:06:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (481, 8, null, 7, 'dislike', '2024-03-13 05:42:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (486, 14, null, 50, 'dislike', '2024-10-09 10:42:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (487, 9, null, 38, 'like', '2024-08-22 15:50:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (488, 2, null, 8, 'dislike', '2024-04-29 06:31:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (489, 5, null, 48, 'like', '2024-07-09 02:52:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (490, 12, null, 16, 'like', '2024-02-20 12:23:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (492, 13, null, 46, 'like', '2024-07-06 14:43:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (493, 15, null, 16, 'like', '2024-07-01 04:29:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (494, 10, null, 49, 'like', '2024-05-18 06:29:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (496, 4, null, 28, 'like', '2024-09-14 18:14:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (497, 8, null, 17, 'like', '2024-03-18 16:36:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (498, 1, null, 31, 'like', '2024-10-14 06:30:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (499, 10, null, 11, 'like', '2024-04-28 23:54:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (500, 15, null, 22, 'like', '2024-09-03 07:53:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (503, 4, 32, null, 'dislike', '2024-06-06 03:39:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (504, 6, 48, null, 'like', '2024-08-22 08:53:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (506, 15, 5, null, 'like', '2024-02-28 13:08:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (507, 4, 11, null, 'dislike', '2024-01-18 16:24:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (508, 9, 41, null, 'dislike', '2024-07-24 12:08:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (510, 10, 40, null, 'like', '2024-02-01 19:26:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (512, 14, 36, null, 'dislike', '2024-01-27 20:08:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (514, 4, 23, null, 'like', '2024-07-15 01:54:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (516, 9, 6, null, 'like', '2024-05-31 13:31:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (517, 10, 29, null, 'dislike', '2024-07-03 11:08:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (518, 8, 3, null, 'dislike', '2024-09-03 07:16:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (519, 10, 33, null, 'like', '2024-07-23 12:38:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (520, 5, 27, null, 'dislike', '2024-05-20 16:33:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (522, 14, 21, null, 'like', '2024-05-29 08:34:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (523, 5, 4, null, 'dislike', '2024-06-25 14:11:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (524, 13, 35, null, 'like', '2024-03-06 05:25:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (525, 2, 40, null, 'like', '2024-04-09 16:03:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (526, 15, 47, null, 'dislike', '2024-04-09 12:35:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (528, 10, 23, null, 'dislike', '2024-06-18 12:12:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (529, 15, 25, null, 'dislike', '2024-06-12 11:32:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (530, 11, 24, null, 'dislike', '2024-08-28 02:55:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (531, 6, 41, null, 'like', '2024-05-22 14:50:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (532, 2, 26, null, 'like', '2024-09-22 19:03:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (533, 13, 45, null, 'dislike', '2024-05-18 03:11:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (534, 14, 11, null, 'like', '2024-03-12 08:03:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (535, 15, 23, null, 'dislike', '2024-08-09 19:56:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (538, 9, 34, null, 'like', '2024-09-20 11:07:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (539, 5, 5, null, 'dislike', '2024-06-12 23:26:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (540, 10, 48, null, 'dislike', '2024-04-17 16:37:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (543, 2, 37, null, 'like', '2024-01-13 23:18:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (544, 15, 12, null, 'like', '2024-03-25 19:45:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (545, 1, 1, null, 'dislike', '2024-08-11 21:23:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (546, 13, 24, null, 'like', '2024-06-01 17:02:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (550, 13, 4, null, 'like', '2024-09-07 05:38:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (551, 1, null, 32, 'like', '2024-06-15 00:40:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (552, 9, null, 45, 'dislike', '2024-02-28 15:50:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (554, 8, null, 37, 'like', '2024-06-05 02:42:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (555, 2, null, 49, 'dislike', '2024-07-05 12:56:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (556, 6, null, 10, 'like', '2024-04-14 05:16:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (557, 11, null, 33, 'like', '2024-02-18 15:14:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (558, 10, null, 39, 'like', '2024-05-17 00:33:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (559, 7, null, 32, 'like', '2024-02-17 02:38:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (560, 10, null, 5, 'like', '2024-03-17 00:23:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (563, 12, null, 48, 'dislike', '2024-10-09 12:00:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (565, 4, null, 48, 'like', '2024-09-07 12:49:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (566, 10, null, 32, 'dislike', '2024-09-06 20:17:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (567, 6, null, 30, 'like', '2024-10-09 14:19:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (568, 5, null, 41, 'dislike', '2024-08-27 16:32:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (569, 6, null, 36, 'dislike', '2024-08-25 08:34:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (571, 4, null, 40, 'like', '2024-03-22 00:14:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (572, 2, null, 17, 'like', '2024-02-26 04:50:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (573, 10, null, 3, 'like', '2024-03-19 10:05:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (574, 15, null, 13, 'dislike', '2024-03-02 12:17:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (575, 3, null, 46, 'like', '2024-03-21 09:30:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (576, 13, null, 29, 'like', '2024-06-08 17:35:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (580, 9, null, 3, 'like', '2024-05-04 17:27:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (583, 5, null, 22, 'dislike', '2024-03-12 13:50:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (584, 9, null, 47, 'like', '2024-07-17 09:15:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (587, 4, null, 50, 'dislike', '2024-07-11 04:31:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (588, 10, null, 37, 'like', '2024-04-24 11:11:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (590, 2, null, 23, 'dislike', '2024-04-18 11:44:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (591, 15, null, 2, 'like', '2024-02-13 23:58:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (594, 15, null, 43, 'like', '2024-02-28 17:30:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (595, 14, null, 46, 'like', '2024-09-05 16:46:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (596, 14, null, 32, 'dislike', '2024-03-17 15:02:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (597, 6, null, 17, 'dislike', '2024-03-14 23:04:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (598, 15, null, 45, 'dislike', '2024-03-26 13:49:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (599, 8, null, 1, 'dislike', '2024-04-22 17:21:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (600, 13, null, 22, 'like', '2024-05-06 02:24:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (601, 12, 3, null, 'like', '2024-10-10 02:48:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (602, 4, 21, null, 'like', '2024-01-22 07:52:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (603, 10, 22, null, 'dislike', '2024-02-02 14:56:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (604, 9, 30, null, 'like', '2024-10-07 03:02:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (605, 11, 10, null, 'like', '2024-06-13 19:58:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (607, 6, 49, null, 'dislike', '2024-05-25 01:55:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (608, 9, 1, null, 'dislike', '2024-07-22 19:58:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (616, 1, 47, null, 'dislike', '2024-07-29 13:21:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (617, 3, 1, null, 'dislike', '2024-05-19 18:48:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (618, 6, 43, null, 'like', '2024-04-06 04:53:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (622, 5, 20, null, 'dislike', '2024-09-01 04:02:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (623, 7, 32, null, 'dislike', '2024-07-30 13:15:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (625, 9, 42, null, 'dislike', '2024-06-15 23:31:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (627, 9, 2, null, 'dislike', '2024-03-27 01:39:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (628, 5, 26, null, 'like', '2024-03-13 20:40:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (629, 11, 18, null, 'dislike', '2024-06-12 02:11:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (630, 5, 31, null, 'like', '2024-03-31 16:42:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (631, 3, 22, null, 'like', '2024-01-22 21:02:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (634, 8, 17, null, 'like', '2024-05-22 01:23:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (636, 13, 16, null, 'dislike', '2024-07-01 18:04:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (637, 9, 26, null, 'dislike', '2024-04-07 23:37:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (638, 2, 47, null, 'like', '2024-04-05 04:58:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (640, 5, 43, null, 'dislike', '2024-09-14 19:36:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (641, 15, 10, null, 'like', '2024-01-13 22:25:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (642, 2, 14, null, 'dislike', '2024-08-13 01:32:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (643, 3, 50, null, 'dislike', '2024-09-04 15:03:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (644, 3, 31, null, 'dislike', '2024-06-26 08:02:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (645, 5, 41, null, 'like', '2024-07-21 22:16:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (649, 11, 2, null, 'like', '2024-02-29 11:00:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (650, 6, 6, null, 'like', '2024-07-12 15:47:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (653, 8, null, 50, 'like', '2024-06-01 01:46:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (654, 15, null, 23, 'dislike', '2024-08-18 09:33:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (655, 4, null, 47, 'dislike', '2024-02-07 07:27:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (656, 4, null, 10, 'dislike', '2024-08-18 10:39:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (657, 12, null, 34, 'like', '2024-09-20 04:04:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (658, 15, null, 25, 'like', '2024-02-19 23:57:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (659, 7, null, 37, 'dislike', '2024-08-21 12:51:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (660, 15, null, 11, 'dislike', '2024-02-19 02:27:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (662, 10, null, 14, 'like', '2024-01-15 06:07:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (663, 7, null, 29, 'like', '2024-04-20 12:38:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (665, 8, null, 12, 'like', '2024-10-04 05:18:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (666, 9, null, 21, 'like', '2024-01-29 09:15:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (668, 6, null, 48, 'like', '2024-02-11 00:32:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (670, 9, null, 19, 'like', '2024-04-28 03:24:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (671, 5, null, 44, 'like', '2024-03-10 13:33:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (672, 3, null, 41, 'like', '2024-07-10 15:43:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (673, 12, null, 25, 'like', '2024-02-27 14:10:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (674, 10, null, 29, 'dislike', '2024-05-23 02:30:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (675, 15, null, 1, 'like', '2024-03-27 22:35:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (678, 14, null, 6, 'like', '2024-09-28 14:28:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (679, 9, null, 39, 'dislike', '2024-02-24 22:13:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (680, 11, null, 18, 'like', '2024-05-21 01:20:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (681, 1, null, 3, 'dislike', '2024-06-02 20:35:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (683, 15, null, 37, 'like', '2024-02-17 01:21:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (685, 2, null, 34, 'dislike', '2024-04-09 22:40:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (686, 8, null, 34, 'like', '2024-02-27 16:15:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (687, 4, null, 6, 'dislike', '2024-05-14 00:02:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (688, 13, null, 2, 'dislike', '2024-04-06 17:38:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (689, 7, null, 30, 'dislike', '2024-10-13 21:29:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (690, 9, null, 9, 'like', '2024-08-04 07:59:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (692, 11, null, 40, 'like', '2024-02-24 12:25:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (695, 5, null, 36, 'dislike', '2024-01-28 02:03:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (697, 6, null, 25, 'dislike', '2024-06-06 04:44:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (698, 4, null, 24, 'like', '2024-04-07 02:18:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (699, 1, null, 42, 'dislike', '2024-04-01 08:06:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (701, 4, 24, null, 'like', '2024-03-23 03:20:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (702, 3, 15, null, 'like', '2024-03-17 02:47:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (704, 6, 15, null, 'dislike', '2024-06-18 10:10:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (706, 9, 40, null, 'dislike', '2024-06-19 05:39:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (707, 11, 5, null, 'dislike', '2024-05-12 06:37:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (708, 15, 46, null, 'dislike', '2024-07-24 04:06:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (709, 8, 9, null, 'dislike', '2024-08-10 19:59:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (712, 1, 31, null, 'dislike', '2024-04-01 06:49:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (713, 6, 10, null, 'like', '2024-02-24 11:41:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (714, 7, 6, null, 'like', '2024-02-28 21:54:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (715, 11, 19, null, 'like', '2024-08-07 09:05:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (716, 14, 2, null, 'like', '2024-02-04 20:25:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (717, 13, 14, null, 'like', '2024-07-06 14:26:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (718, 11, 47, null, 'like', '2024-03-22 22:24:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (720, 8, 14, null, 'dislike', '2024-05-23 20:19:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (722, 5, 21, null, 'like', '2024-08-05 18:17:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (725, 5, 7, null, 'like', '2024-09-03 01:31:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (727, 11, 45, null, 'like', '2024-03-12 15:49:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (728, 1, 24, null, 'like', '2024-02-08 02:13:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (729, 10, 15, null, 'dislike', '2024-02-02 06:37:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (732, 4, 50, null, 'dislike', '2024-05-13 19:56:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (734, 2, 18, null, 'dislike', '2024-07-08 01:10:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (735, 15, 4, null, 'like', '2024-04-05 12:01:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (736, 3, 16, null, 'dislike', '2024-05-24 05:16:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (737, 2, 16, null, 'like', '2024-01-27 19:05:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (739, 11, 33, null, 'dislike', '2024-03-07 22:29:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (741, 5, 9, null, 'dislike', '2024-02-28 01:04:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (742, 8, 42, null, 'like', '2024-05-01 12:11:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (747, 5, 2, null, 'dislike', '2024-09-09 04:07:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (749, 8, 23, null, 'like', '2024-09-16 03:39:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (750, 11, 44, null, 'dislike', '2024-06-07 09:33:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (753, 1, null, 1, 'dislike', '2024-04-21 08:15:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (755, 3, null, 34, 'dislike', '2024-05-17 13:46:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (756, 10, null, 42, 'dislike', '2024-01-27 01:51:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (757, 2, null, 13, 'like', '2024-04-14 06:57:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (759, 15, null, 44, 'like', '2024-04-07 21:01:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (760, 9, null, 31, 'dislike', '2024-03-22 00:24:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (762, 15, null, 8, 'like', '2024-02-07 12:24:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (764, 13, null, 27, 'dislike', '2024-08-28 14:32:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (765, 13, null, 8, 'dislike', '2024-06-21 07:52:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (766, 4, null, 15, 'dislike', '2024-07-23 06:11:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (767, 14, null, 9, 'like', '2024-04-16 01:48:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (768, 5, null, 6, 'dislike', '2024-04-22 17:54:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (770, 5, null, 2, 'dislike', '2024-10-05 00:25:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (771, 10, null, 15, 'dislike', '2024-07-28 04:46:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (772, 13, null, 44, 'like', '2024-05-06 01:25:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (774, 5, null, 3, 'dislike', '2024-08-05 06:36:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (775, 12, null, 22, 'dislike', '2024-09-21 15:33:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (776, 2, null, 19, 'dislike', '2024-04-01 09:32:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (779, 9, null, 13, 'like', '2024-05-12 22:01:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (783, 7, null, 2, 'dislike', '2024-07-07 04:29:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (785, 13, null, 47, 'like', '2024-04-15 07:46:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (787, 9, null, 29, 'like', '2024-03-09 20:35:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (788, 3, null, 16, 'like', '2024-07-20 15:21:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (793, 3, null, 4, 'dislike', '2024-09-20 12:30:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (794, 15, null, 5, 'dislike', '2024-07-31 23:08:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (795, 5, null, 23, 'dislike', '2024-02-01 05:20:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (796, 3, null, 49, 'dislike', '2024-05-02 18:45:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (802, 12, 31, null, 'like', '2024-01-23 18:52:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (803, 14, 20, null, 'like', '2024-07-18 23:47:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (804, 10, 50, null, 'like', '2024-07-29 19:00:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (805, 9, 14, null, 'dislike', '2024-03-04 05:38:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (806, 11, 13, null, 'dislike', '2024-03-12 21:39:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (807, 6, 33, null, 'like', '2024-04-01 03:23:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (808, 5, 13, null, 'like', '2024-04-07 05:37:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (810, 12, 16, null, 'like', '2024-09-07 20:32:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (811, 14, 4, null, 'dislike', '2024-09-27 10:03:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (812, 15, 35, null, 'dislike', '2024-04-28 10:35:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (813, 9, 13, null, 'like', '2024-02-13 19:24:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (814, 3, 45, null, 'like', '2024-02-01 11:18:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (816, 6, 50, null, 'dislike', '2024-08-29 08:22:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (817, 15, 29, null, 'like', '2024-07-15 01:50:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (818, 14, 25, null, 'like', '2024-04-20 02:47:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (819, 5, 11, null, 'dislike', '2024-06-28 09:58:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (820, 10, 3, null, 'dislike', '2024-05-15 05:04:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (823, 7, 10, null, 'dislike', '2024-08-26 21:15:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (825, 5, 25, null, 'like', '2024-08-03 20:18:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (826, 10, 31, null, 'dislike', '2024-07-24 04:03:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (827, 13, 43, null, 'like', '2024-03-05 11:23:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (828, 14, 14, null, 'like', '2024-02-07 15:20:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (830, 1, 25, null, 'dislike', '2024-03-26 18:56:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (831, 8, 4, null, 'dislike', '2024-07-05 02:49:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (833, 12, 10, null, 'like', '2024-10-09 10:50:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (837, 8, 44, null, 'like', '2024-08-19 02:11:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (838, 10, 46, null, 'like', '2024-04-30 08:36:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (839, 5, 18, null, 'like', '2024-08-12 00:42:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (840, 3, 10, null, 'dislike', '2024-06-21 15:58:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (842, 4, 15, null, 'like', '2024-10-06 04:32:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (844, 1, 22, null, 'dislike', '2024-01-17 07:28:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (846, 7, 18, null, 'like', '2024-10-12 01:21:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (849, 4, 27, null, 'dislike', '2024-08-16 05:08:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (850, 3, 9, null, 'like', '2024-01-24 01:50:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (852, 4, null, 41, 'like', '2024-04-10 04:14:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (853, 1, null, 14, 'like', '2024-03-27 22:13:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (854, 9, null, 32, 'dislike', '2024-08-04 14:40:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (856, 11, null, 31, 'dislike', '2024-01-19 05:30:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (857, 11, null, 39, 'like', '2024-03-12 03:38:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (859, 14, null, 18, 'like', '2024-06-04 11:14:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (861, 8, null, 43, 'like', '2024-03-16 23:04:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (862, 4, null, 25, 'like', '2024-01-20 07:17:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (864, 14, null, 29, 'dislike', '2024-07-17 12:57:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (866, 7, null, 1, 'dislike', '2024-04-09 16:11:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (867, 6, null, 24, 'dislike', '2024-03-23 18:50:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (868, 8, null, 49, 'dislike', '2024-09-11 09:46:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (869, 7, null, 7, 'like', '2024-07-05 16:37:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (870, 1, null, 30, 'dislike', '2024-07-08 23:10:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (871, 7, null, 44, 'dislike', '2024-04-09 11:23:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (872, 3, null, 12, 'like', '2024-07-03 03:24:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (873, 1, null, 18, 'dislike', '2024-06-17 04:58:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (875, 9, null, 33, 'dislike', '2024-03-04 07:59:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (876, 11, null, 34, 'dislike', '2024-08-18 17:08:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (879, 8, null, 45, 'like', '2024-01-25 16:28:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (880, 11, null, 16, 'dislike', '2024-01-30 22:42:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (884, 6, null, 8, 'like', '2024-08-09 03:11:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (885, 13, null, 10, 'like', '2024-08-28 09:58:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (887, 5, null, 43, 'dislike', '2024-03-14 06:49:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (888, 2, null, 14, 'dislike', '2024-06-08 08:29:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (889, 3, null, 35, 'like', '2024-08-02 22:29:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (890, 2, null, 10, 'dislike', '2024-03-13 20:15:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (891, 9, null, 50, 'dislike', '2024-06-16 11:08:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (894, 11, null, 24, 'dislike', '2024-04-08 17:48:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (898, 4, null, 1, 'like', '2024-03-08 21:11:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (899, 5, null, 50, 'like', '2024-07-09 15:10:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (901, 15, 42, null, 'dislike', '2024-08-07 03:09:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (902, 4, 20, null, 'dislike', '2024-04-21 05:53:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (903, 5, 32, null, 'dislike', '2024-02-02 11:16:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (905, 4, 49, null, 'dislike', '2024-01-28 16:04:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (911, 9, 24, null, 'like', '2024-02-12 17:26:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (913, 6, 45, null, 'dislike', '2024-04-08 01:12:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (914, 1, 4, null, 'dislike', '2024-01-04 18:03:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (918, 15, 15, null, 'dislike', '2024-01-14 14:04:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (919, 1, 3, null, 'dislike', '2024-07-19 22:36:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (923, 4, 45, null, 'dislike', '2024-04-10 22:25:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (927, 1, 8, null, 'dislike', '2024-08-31 23:27:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (928, 8, 41, null, 'dislike', '2024-05-25 23:53:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (929, 6, 7, null, 'dislike', '2024-07-15 10:06:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (931, 14, 15, null, 'like', '2024-02-25 18:08:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (932, 5, 49, null, 'dislike', '2024-01-24 16:32:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (934, 12, 48, null, 'like', '2024-10-08 17:35:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (935, 14, 44, null, 'dislike', '2024-07-15 01:15:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (937, 3, 33, null, 'like', '2024-08-23 11:32:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (939, 7, 41, null, 'dislike', '2024-10-11 21:27:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (942, 11, 15, null, 'like', '2024-02-27 12:37:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (943, 14, 24, null, 'like', '2024-10-04 16:04:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (948, 10, 43, null, 'dislike', '2024-07-12 06:19:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (950, 12, 21, null, 'like', '2024-06-18 22:49:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (951, 8, null, 44, 'like', '2024-02-29 01:37:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (952, 1, null, 5, 'dislike', '2024-04-19 15:12:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (954, 2, null, 28, 'like', '2024-03-18 11:23:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (955, 3, null, 20, 'dislike', '2024-10-06 16:19:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (957, 9, null, 8, 'dislike', '2024-08-04 12:18:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (958, 11, null, 11, 'dislike', '2024-01-12 20:35:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (962, 13, null, 50, 'dislike', '2024-03-04 13:14:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (965, 8, null, 8, 'dislike', '2024-04-29 12:04:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (966, 5, null, 5, 'dislike', '2024-04-27 03:39:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (969, 1, null, 23, 'dislike', '2024-09-28 11:39:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (970, 1, null, 11, 'dislike', '2024-02-12 03:48:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (973, 12, null, 24, 'dislike', '2024-07-15 18:54:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (974, 9, null, 14, 'like', '2024-07-11 18:52:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (975, 9, null, 46, 'like', '2024-07-20 18:37:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (980, 6, null, 41, 'dislike', '2024-08-13 18:29:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (982, 2, null, 44, 'dislike', '2024-05-31 14:02:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (983, 12, null, 23, 'dislike', '2024-06-18 03:40:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (986, 9, null, 44, 'like', '2024-05-29 00:16:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (988, 1, null, 34, 'dislike', '2024-08-07 07:28:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (989, 15, null, 41, 'like', '2024-08-24 14:48:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (990, 10, null, 50, 'like', '2024-07-16 21:18:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (991, 5, null, 16, 'dislike', '2024-04-14 14:00:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (992, 15, null, 15, 'dislike', '2024-08-08 21:34:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (997, 9, null, 11, 'dislike', '2024-03-10 05:59:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (999, 15, null, 28, 'dislike', '2024-03-08 23:10:58');
