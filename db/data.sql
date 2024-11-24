/* START - PROJECT DATA */

USE TechCloud;

/* Users */
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (1, 'ashtyn72', 'Ashtyn Mertz', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'ashtyn_mertz51@hotmail.com', 1, 'f087c61d-1aa9-4dcf-95db-d6e0d1ac15d1.png', 57, 'user', '2024-02-12 09:13:34');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (2, 'manuela.corkery', 'Manuela Corkery', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'manuela.corkery70@yahoo.com', 1, 'f876193e-3f4f-40a9-9c26-5610f1e4f0a8.png', 59, 'user', '2024-07-30 21:58:26');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (3, 'yazmin.deckow17', 'Yazmin Deckow', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'yazmin.deckow21@hotmail.com', 1, 'aaffb97a-8c23-4af5-b2bc-959e9c08f427.png', 34, 'user', '2024-09-12 04:01:15');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (4, 'griffin_murazik4', 'Griffin Murazik', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'griffin_murazik80@yahoo.com', 1, '3e65d4ce-bc3e-489d-b6c3-477661d8b3bc.png', 25, 'user', '2024-03-29 16:13:57');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (5, 'brenden41', 'Brenden Carter', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'brenden_carter@hotmail.com', 1, '05443623-b462-4b6c-8ea4-4be70a3d23ef.png', 61, 'user', '2024-08-26 04:19:02');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (6, 'lyda.gerhold', 'Lyda Gerhold', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'lyda.gerhold@yahoo.com', 1, 'e5a789ef-01d9-406a-9bfa-5fb53dd23ac8.png', 84, 'user', '2024-10-25 20:37:46');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (7, 'harmony15', 'Harmony Schaefer', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'harmony.schaefer@gmail.com', 1, '50491eda-44d5-444a-a235-44b9ae720c0e.png', 38, 'user', '2024-10-24 19:43:23');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (8, 'lea.goyette', 'Lea Goyette', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$a6pSFFiYH7+HtupngVvkiWgs5wgE0BQkDMhFQ14NPws', 'lea.goyette31@hotmail.com', 1, 'de084b61-164d-49fb-8ae3-f9bc73160ad4.png', 60, 'user', '2024-10-10 15:20:43');
INSERT INTO users (id, login, fullName, password, email, isVerified, profilePicture, rating, role, creationAt) VALUES (9, 'admin', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$JFBoYW50b20kTGliZXJ0eQ$jIHvPnZNS4D/7hMnjBrhq8HbcSqHjU4/aHNYBCWQsa8', 'admin@com', 1, 'default.png', 0, 'admin', '2024-11-16 13:53:26');

/* Posts */
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (9, 'What are the principles of effective UI/UX design?', 'Effective UI/UX design ensures usability, accessibility, and aesthetics. Principles include:
- **Consistency**: Maintain uniformity in design elements.
- **Feedback**: Provide visual or auditory cues.
- **Simplicity**: Reduce cognitive load by avoiding clutter.
', 'active', 1, 7, 7, '2024-10-03 14:58:53');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (18, 'What are the advantages of learning multiple programming languages?', 'Learning multiple programming languages enables developers to:
- Choose the best tool for specific tasks.
- Adapt to diverse project requirements.
- Understand different programming paradigms (e.g., OOP, functional).

| Language     | Key Advantage                    |
|--------------|----------------------------------|
| Python       | Versatility and simplicity       |
| JavaScript   | Frontend and backend development |
| C++          | High-performance applications    |
', 'active', 1, 4, 4, '2024-08-01 06:43:39');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (20, 'What are the best practices for managing memory in Java?', 'Effective memory management in Java can prevent issues like memory leaks. Key practices include:
- Using the **try-with-resources** statement for closing resources automatically.
- Leveraging garbage collection by nullifying unused references.
- Profiling memory usage with tools like VisualVM.

Example:
```java
try (BufferedReader reader = new BufferedReader(new FileReader("file.txt"))) {
    String line;
    while ((line = reader.readLine()) != null) {
        System.out.println(line);
    }
}
```
', 'active', 0, 4, 3, '2024-11-05 23:23:38');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (21, 'How can tech professionals maintain work-life balance?', '> “Life is a dance between making it happen and letting it happen.”

Tips include:
- Scheduling regular breaks.
- Prioritizing family and hobbies.
- Using tools like calendar blocking to manage tasks.
', 'active', 1, 4, 8, '2024-08-19 14:38:20');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (1, 'How to implement multithreading in Java?', 'Java supports multithreading using the **Thread** class or **Runnable** interface.

Example:
```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread is running");
    }
}
MyThread thread = new MyThread();
thread.start();
```

Alternatively, use **ExecutorService** for thread pool management.', 'active', 1, 8, 6, '2024-07-01 06:31:10');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (12, 'What are CSS animations and how do I create them?', 'CSS animations add dynamic behavior to web pages. Use the `@keyframes` rule to define animations.

Example:
```css
@keyframes slideIn {
    from {
        transform: translateX(-100%);
    }
    to {
        transform: translateX(0);
    }
}

.element {
    animation: slideIn 2s ease-in-out;
}
```', 'active', 0, 7, 1, '2024-02-05 06:20:30');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (11, 'How to stay motivated while learning to code?', 'Staying motivated involves setting achievable goals, finding supportive communities, and celebrating progress.
> "Motivation is what gets you started. Habit is what keeps you going." — Jim Ryun
', 'active', 1, 6, 2, '2024-09-28 07:20:55');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (10, 'How can mindfulness improve daily productivity?', 'Mindfulness helps improve focus, reduce stress, and enhance productivity by training the mind to stay present. As Thich Nhat Hanh said:
> “The present moment is the only time over which we have dominion.”
Consider practicing short mindful breaks during work, such as 5-minute breathing exercises, to improve clarity and decision-making.', 'active', 0, 7, 8, '2024-10-30 13:51:24');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (22, 'How to manage time complexity in algorithms?', 'To optimize time complexity:
1. Understand the input size and expected growth rate.
2. Choose appropriate data structures.
3. Use Big-O notation to estimate performance.

Example table of algorithm complexities:
| Algorithm         | Time Complexity |
|-------------------|-----------------|
| Binary Search     | O(log n)        |
| Quick Sort        | O(n log n)      |
| Bubble Sort       | O(n^2)          |', 'active', 0, 4, 8, '2024-03-30 07:20:11');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (7, 'How to handle asynchronous operations in JavaScript?', 'JavaScript handles asynchronous operations using:
- **Callbacks**: Traditional approach but can lead to callback hell.
- **Promises**: Manage async tasks more elegantly.
- **Async/Await**: Simplifies asynchronous code.

Example:
```javascript
async function fetchData() {
    try {
        const response = await fetch(''https://api.example.com/data'');
        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error(''Error fetching data:'', error);
    }
}
fetchData();
```
', 'active', 1, 8, 3, '2024-09-06 20:20:07');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (6, 'How can technology be used to maintain a healthy lifestyle?', 'Technology aids in health management through:
- Fitness tracking apps like Fitbit.
- Online yoga and meditation platforms.
- Smart devices for monitoring vitals like heart rate.
', 'active', 0, 8, 2, '2024-08-06 08:13:09');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (4, 'What is the difference between var, let, and const in JavaScript?', '| Keyword | Scope          | Reassignment | Hoisting Behavior |
|---------|----------------|--------------|-------------------|
| var     | Function       | Allowed      | Hoisted with `undefined` |
| let     | Block          | Allowed      | Hoisted but uninitialized |
| const   | Block          | Not Allowed  | Hoisted but uninitialized |

Example:
```javascript
let x = 10;
const y = 20;
// y = 30; // Error: Assignment to constant variable
var z = 15;
```
', 'active', 0, 8, 5, '2024-06-01 11:12:06');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (24, 'How can I optimize JavaScript code for better performance?', 'Optimization techniques:
- Minimize DOM manipulations.
- Use debouncing and throttling for event listeners.
- Leverage modern JavaScript features like `for...of` loops and `Map`/`Set` objects.
', 'active', 0, 6, 3, '2024-02-25 23:34:19');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (13, 'Cohibeo alter aegrotatio vinitor.', 'Nostrum admiratio vito tamen. Via audio arma tracto vindico velum ulciscor molestias benevolentia quos. Amplexus confido strues doloribus sunt.
Deprimo maxime undique. Odit cresco cresco. Tergum cibo subnecto ducimus credo aegrotatio.
Celebrer amplus cinis auctus coerceo. Sperno utrimque sumptus succedo teres voluptatum sumptus. Quibusdam quos trepide cena templum carcer arbitro.', 'inactive', 0, 7, 6, '2024-01-11 01:27:01');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (23, 'What are the principles of effective UI/UX design?', 'UI/UX design is essential for product success. I want to know about principles that lead to a great user experience. Abbas tristis dolore amoveo surculus capitulus. Angulus thorax aestus odit terminatio adfectus abscido defungo crudelis recusandae. Demo arbustum vespillo constans crapula.', 'inactive', 0, 7, 7, '2024-04-20 08:28:15');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (19, 'Minima administratio debeo xiphias vivo cohors sto cumque rem.', 'Deporto delicate possimus facilis tempus velociter tantum vergo cilicium alii. Tergiversatio deorsum utilis constans curso vox soluta vilis. Stips congregatio tollo condico cavus una facere demum addo aduro.
Auctor ademptio sodalitas summa creber aranea aetas peior patruus adipisci. Videlicet dolorum verbum aliquam impedit articulus. Capillus audio dedecor appono stabilis.
Ter vulgivagus vita accusantium. Contra sto candidus textus audax validus tolero. Dolor temporibus comitatus sophismata suffragium attonbitus ipsa.', 'inactive', 0, 2, 3, '2024-06-05 15:42:36');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (25, 'Adsum amissio ipsum suffragium apostolus crepusculum aperte saepe adsum.', 'Varius votum terebro nostrum canto titulus. Uredo rem argumentum adimpleo demonstro accusator. Tutis derideo unus tribuo verus sumptus accusantium.
Creber sponte advenio totidem creo circumvenio territo antiquus tenus clementia. Cunabula vociferor substantia solitudo socius argentum depopulo confido vorax beatus. Repellat adaugeo aqua cultura velit fugit.
Corrumpo decor acidus. Sumptus crur articulus curis tunc. Suadeo ultra argentum coniecto tempus.', 'inactive', 1, 3, 1, '2024-04-06 06:33:54');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (17, 'Cilicium cetera tergiversatio patria.', 'Veritas molestiae suscipio tres volup cruentus concido tremo averto strues. Ratione victoria abutor ipsum quia abstergo. Illum derelinquo cuius deduco sto aperte aeternus stillicidium depono.
Quia adfectus nemo expedita delicate tracto. Civis conturbo cruciamentum thesis tamquam teneo valeo tertius tabula. Tabula tenax aestas numquam antea canto amet animi corroboro dolorum.
Volaticus timor vestrum cena ipsam volva adipisci vitium vitiosus fuga. Appositus conitor vetus. Laudantium aveho cohors averto tondeo contego nobis quos.', 'inactive', 0, 6, 2, '2024-04-25 00:43:06');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (16, 'Teneo debilito cubitum suffoco stipes similique vinum totam consequuntur accendo.', 'Damno vis animi aurum dignissimos tubineus. Decipio stella calamitas admoneo arcesso curis. Tenus infit stips velum auxilium timor demum coepi.
Comptus delibero solum explicabo angelus cogo audax. Defluo vulnero cohors arbustum urbs facere congregatio vulgo. Suscipit socius amplus totam capto cultura.
Concido adsidue vaco celebrer adstringo verbum ultra. Sequi truculenter verbera thesaurus temptatio tero vulgo sonitus. Provident curso cito terror utroque.', 'inactive', 0, 8, 7, '2024-03-02 04:25:35');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (15, 'Tabella vae crinis vos adsuesco crustulum spiritus concido bibo vociferor.', 'Unus aureus valeo somniculosus volo. Solitudo praesentium aut corporis. Arx angelus crapula culpo tenax decimus doloribus utpote vociferor agnitio.
Deleo dens ter soleo thema taedium assumenda deorsum fugiat. Super tot velum comptus suadeo torqueo. Aperte tam aptus villa aequitas amo casso vulticulus communis suus.
Excepturi concido umquam absorbeo. Arca expedita casus explicabo tui usus valde. Depereo crur tergiversatio correptius tubineus labore centum.', 'inactive', 1, 8, 1, '2024-09-06 05:04:51');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (14, 'Quas compello cupiditas.', 'Adeo sumptus maxime terreo tyrannus sol. Alius civis vado suadeo caute bis aliquam creber admitto autem. Hic porro tamisium nisi comis est id venustas vita caste.
Cui annus statim patrocinor vae adduco adsuesco tego vitae cornu. Velum animi aurum articulus adiuvo color. Sum tabula verumtamen colligo.
Apto voluptate ancilla. Deficio adversus minus unus accusator sperno abstergo amet delectus. Alveus cognatus clam sum cavus earum tenetur.', 'inactive', 0, 7, 3, '2024-10-07 23:27:35');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (8, 'Aut apto vinco vito defero ocer.', 'Nobis solvo vestrum. Suus corroboro comes numquam ustulo agnitio verumtamen. Odio tametsi cubicularis venio alter.
Corrigo suscipit pecus aestivus absum allatus. Appello aspernatur vulgivagus decens abutor ambulo. Deleo admoneo avaritia sumo aufero adimpleo terreo canis argumentum.
Dolorum catena vita. Cornu consuasor demergo. Bestia supra desolo curo debitis viriliter commodi benevolentia.', 'inactive', 0, 7, 2, '2024-04-07 23:16:30');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (5, 'Solum utrimque tumultus cavus atqui pecus cribro.', 'Saepe ventus victoria cumque ait vix. Dens victus causa copia turba corroboro cognomen clamo acer voluptates. Texo cogito coniuratio.
Canonicus centum quos bellum amor virga. Textilis tantillus votum caute deprimo uterque aiunt suppellex adulescens adsuesco. Ipsum deputo solium in despecto tergeo thema rerum.
Caput terebro tamisium audio ter calco templum quibusdam. Demulceo verumtamen avarus laboriosam ulciscor certe adulatio cruciamentum. Excepturi arguo stabilis vinum aestas acerbitas conforto admoveo creator.', 'inactive', 0, 8, 6, '2024-02-20 09:44:25');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (3, 'Adstringo campana nostrum.', 'Clementia uberrime textilis. Aptus desipio facere tonsor combibo ventosus ars aureus altus communis. Quos valetudo dolorum.
Trucido aeternus unus quos coaegresco territo saepe vestigium. Arma trado summisse adipisci bestia velum assentator possimus tergo cuppedia. Vulnus vomica animi tumultus.
Vereor defero atrocitas vae adulatio denique cernuus vulgo quasi. Terror vorago super. Admitto traho speculum tutis collum tergeo constans amissio.', 'inactive', 0, 8, 7, '2024-09-23 22:18:22');
INSERT INTO posts (id, title, content, status, showOnHomepage, likes, creationById, creationAt) VALUES (2, 'Itaque harum adipiscor appello sopor.', 'Vallum asper ara decet paens demo valens cedo curso. Tot architecto pax fugit armarium nobis tunc censura colo argumentum. Et vulticulus decerno.
Uxor victoria casus. Sub tabella error demoror currus veritatis cattus tempora uredo ducimus. Dedecor suppellex vita corrumpo cura.
Succedo tonsor ultio vulgivagus vulticulus. Quam cursim speculum cervus. Theca thesaurus blanditiis admoneo conspergo creator dolore.', 'inactive', 0, 8, 1, '2024-03-22 11:11:54');



/* Categories */
INSERT INTO categories (id, title, description, creationAt) VALUES (1, '🚀 JavaScript', 'JavaScript is a versatile programming language used for creating interactive and dynamic web content. It powers many modern web applications. Essential for front-end developers.', '2024-07-24 09:45:45');
INSERT INTO categories (id, title, description, creationAt) VALUES (2, '📚 Education', 'Education is the foundation of knowledge and skill development. Continuous learning is key to success in any career.', '2024-06-23 20:58:21');
INSERT INTO categories (id, title, description, creationAt) VALUES (3, '🍬 Java', 'Java is a powerful, object-oriented programming language designed to be platform-independent. It is popular for enterprise applications and large-scale systems.', '2024-08-09 12:00:32');
INSERT INTO categories (id, title, description, creationAt) VALUES (4, '🤩 UI/UX', 'UI/UX design focuses on creating a seamless user experience and visually appealing interfaces. It combines user psychology with design principles.', '2024-06-22 00:28:05');
INSERT INTO categories (id, title, description, creationAt) VALUES (5, '🎨 CSS', 'CSS, or Cascading Style Sheets, is used to style and layout web pages. It defines colors, layouts, and overall presentation of HTML elements.', '2024-02-05 03:26:39');
INSERT INTO categories (id, title, description, creationAt) VALUES (6, '🏗️ HTML', 'HTML is the standard markup language for creating web pages. It structures the content and provides the foundation for web development.', '2024-07-18 10:18:08');
INSERT INTO categories (id, title, description, creationAt) VALUES (7, '👩‍💻 Programming', 'Programming involves writing code to develop software applications, automate tasks, and solve problems. A critical skill in the digital age.', '2024-09-21 16:52:00');
INSERT INTO categories (id, title, description, creationAt) VALUES (8, '🏔️ Lifestyle', 'Lifestyle encompasses habits, behaviors, and routines that shape one’s daily life. It is influenced by personal interests and well-being.', '2024-05-09 14:05:44');

/* Post Categories */
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (3, 14, 2, '2024-04-09 01:31:20');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (5, 5, 6, '2024-04-05 09:24:42');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (6, 13, 4, '2024-03-15 06:24:53');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (8, 25, 4, '2024-09-01 00:03:36');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (9, 9, 5, '2024-05-21 13:38:59');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (11, 13, 1, '2024-08-03 01:38:37');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (12, 15, 1, '2024-10-15 11:06:26');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (15, 5, 7, '2024-07-08 20:37:08');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (16, 1, 3, '2024-08-14 14:41:14');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (18, 2, 7, '2024-10-16 10:53:29');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (19, 3, 2, '2024-10-01 16:41:28');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (21, 16, 4, '2024-02-20 23:55:36');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (23, 2, 4, '2024-10-02 12:59:02');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (25, 19, 5, '2024-10-21 09:10:04');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (27, 16, 1, '2024-03-31 01:08:21');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (30, 2, 8, '2024-02-06 17:49:03');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (32, 8, 6, '2024-03-14 21:10:32');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (36, 6, 5, '2024-06-05 06:21:21');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (37, 15, 7, '2024-03-10 01:49:50');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (38, 9, 6, '2024-04-16 02:51:07');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (41, 21, 7, '2024-03-24 10:20:45');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (42, 12, 4, '2024-09-23 10:25:14');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (46, 17, 5, '2024-02-27 13:10:11');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (47, 17, 4, '2024-05-16 03:55:06');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (48, 2, 6, '2024-06-11 20:09:29');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (49, 19, 6, '2024-09-16 02:50:49');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (50, 6, 7, '2024-04-07 04:30:19');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (55, 3, 8, '2024-02-14 00:52:58');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (57, 22, 2, '2024-10-29 04:47:07');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (59, 8, 5, '2024-01-28 23:12:56');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (64, 23, 5, '2024-02-02 03:30:16');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (67, 5, 8, '2024-06-27 09:25:27');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (72, 6, 2, '2024-08-24 13:28:05');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (74, 8, 3, '2024-03-03 20:29:42');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (76, 24, 1, '2024-11-16 13:44:35');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (77, 24, 7, '2024-11-16 13:44:35');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (78, 20, 3, '2024-11-16 13:45:13');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (79, 20, 7, '2024-11-16 13:45:13');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (80, 23, 4, '2024-11-16 13:46:21');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (81, 23, 6, '2024-11-16 13:46:21');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (82, 22, 7, '2024-11-16 13:49:08');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (83, 21, 8, '2024-11-16 13:49:55');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (84, 12, 5, '2024-11-16 13:59:05');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (85, 12, 6, '2024-11-16 13:59:05');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (86, 11, 7, '2024-11-16 13:59:57');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (87, 11, 2, '2024-11-16 13:59:57');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (88, 4, 1, '2024-11-16 14:02:38');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (89, 7, 1, '2024-11-16 14:04:44');
INSERT INTO posts_categories (id, postId, categoryId, creationAt) VALUES (90, 18, 2, '2024-11-24 18:03:48');

/* Post Favorites */
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (1, 7, 8, '2024-01-04 09:12:47');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (2, 7, 12, '2024-01-18 01:53:51');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (3, 8, 14, '2024-11-10 08:53:32');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (4, 6, 23, '2024-10-26 00:06:28');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (5, 2, 13, '2024-10-07 02:31:14');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (6, 2, 8, '2024-02-14 06:16:13');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (7, 5, 10, '2024-10-07 19:29:05');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (8, 8, 4, '2024-02-07 16:22:48');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (9, 8, 3, '2024-04-01 21:42:43');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (10, 3, 5, '2024-07-05 05:29:50');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (11, 6, 12, '2024-05-23 08:18:26');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (12, 1, 16, '2024-03-19 10:58:47');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (13, 1, 11, '2024-08-24 15:24:15');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (14, 7, 11, '2024-09-06 02:13:34');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (15, 3, 11, '2024-07-25 02:08:55');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (17, 7, 20, '2024-07-24 06:06:39');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (18, 3, 17, '2024-06-29 09:47:37');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (20, 5, 23, '2024-10-09 03:44:40');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (21, 1, 21, '2024-11-02 13:07:01');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (22, 5, 16, '2024-04-18 02:29:25');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (24, 3, 9, '2024-06-16 03:55:58');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (25, 7, 4, '2024-05-30 08:19:52');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (26, 6, 22, '2024-06-22 08:20:34');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (28, 1, 7, '2024-07-08 00:12:02');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (29, 5, 5, '2024-05-01 14:32:49');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (30, 8, 10, '2024-05-26 06:14:02');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (31, 8, 9, '2024-02-13 21:07:26');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (32, 8, 5, '2024-07-23 07:37:01');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (33, 7, 14, '2024-09-16 19:56:46');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (34, 5, 4, '2024-08-26 23:10:54');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (35, 7, 1, '2024-01-23 07:22:50');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (36, 5, 13, '2024-07-17 03:24:53');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (38, 2, 12, '2024-02-22 01:37:33');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (40, 3, 18, '2024-09-24 11:04:20');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (41, 4, 13, '2024-11-16 13:40:42');
INSERT INTO posts_favorites (id, creationById, postId, creationAt) VALUES (42, 4, 11, '2024-11-16 14:09:56');

/* Comments */
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (1, null, 18, 4, 'Altus decor adulescens viduo auctus suggero subnecto cinis eaque ullam.', 1, 'active', '2024-01-09 07:35:08');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (2, null, 9, 6, 'Copia apostolus odio cupressus depereo ex adsum adipiscor.', 1, 'active', '2024-05-30 02:16:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (3, null, 17, 6, 'Corrupti depono conscendo damno desidero aspicio demum viscus depulso.', 0, 'active', '2024-10-28 06:12:25');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (4, null, 17, 2, 'Abstergo agnosco odit canto sumptus arx adulescens.', 0, 'active', '2024-05-11 03:36:25');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (5, null, 13, 3, 'Cruentus patior canonicus aro quaerat coruscus.', 0, 'active', '2024-10-09 16:30:20');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (6, null, 13, 8, 'Antea tepidus super valens hic.', 0, 'active', '2024-09-10 22:47:01');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (7, null, 3, 5, 'Tabella subnecto adicio vigilo amicitia surculus.', 0, 'active', '2024-02-21 16:58:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (8, null, 21, 2, 'Tum armarium quo coniecto corona cur dedico iure amo vulticulus.', 0, 'inactive', '2024-06-19 21:49:42');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (9, null, 21, 1, 'Coadunatio esse vero abduco accommodo cado.', 0, 'inactive', '2024-06-27 09:14:32');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (10, null, 15, 5, 'Spoliatio expedita arguo.', 0, 'inactive', '2024-01-11 05:53:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (11, null, 17, 5, 'Claro admoveo statua tracto tendo culpa benevolentia.', 0, 'active', '2024-07-17 20:10:20');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (12, null, 21, 6, 'Amiculum pax cum architecto adhaero atqui crinis.', 0, 'active', '2024-08-05 22:33:41');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (13, null, 11, 1, 'Cotidie degenero ad aegrotatio dens.', 0, 'active', '2024-05-31 03:12:29');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (14, null, 23, 4, 'Attollo advenio curriculum.', 0, 'active', '2024-03-20 15:53:54');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (15, null, 14, 1, 'Ulciscor aptus uxor cohibeo amplus amissio coruscus acer.', 0, 'active', '2024-05-30 07:57:19');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (16, null, 4, 3, 'Comes auctor temporibus tempus patria unde.', 1, 'active', '2024-04-02 12:05:31');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (17, null, 1, 6, 'Amet convoco textor aro excepturi.', 0, 'active', '2024-06-14 15:18:20');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (18, null, 24, 6, 'Optio contigo arca.', 0, 'active', '2024-07-28 22:23:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (19, null, 1, 6, 'Cohibeo aeneus quasi deleo fugit confido vergo.', 0, 'active', '2024-07-19 00:12:56');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (20, null, 19, 8, 'Tutis cubicularis ocer cena agnitio vis censura.', 0, 'inactive', '2024-02-03 00:20:46');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (21, null, 2, 8, 'Balbus fuga delectatio decumbo vis virgo vigor decipio combibo admoveo.', 0, 'inactive', '2024-08-05 03:16:06');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (22, null, 21, 5, 'Stella tempora sustineo confugo patrocinor vinum voveo usitas cupiditas coerceo.', 0, 'inactive', '2024-01-23 17:24:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (23, null, 22, 1, 'Acer cimentarius alter at.', 1, 'active', '2024-07-18 09:01:01');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (24, null, 17, 8, 'Virtus magnam clibanus veritas.', 0, 'active', '2024-10-31 05:44:25');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (25, null, 13, 2, 'Utrum veniam tener sto taedium deorsum quibusdam valens.', 0, 'active', '2024-08-20 22:15:15');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (26, null, 20, 8, 'Corrumpo sto abduco crux appello similique.', 0, 'inactive', '2024-08-14 21:35:00');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (27, null, 22, 5, 'Voco tabella caute.', 0, 'active', '2024-06-17 03:48:36');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (28, null, 20, 7, 'Celer sol cohaero inventore tabernus capillus thorax sursum aperte.', 0, 'inactive', '2024-09-11 22:38:43');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (29, null, 21, 2, 'Desino laudantium ventosus.', 1, 'active', '2024-01-16 07:53:03');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (30, null, 5, 4, 'Subiungo ambulo verumtamen ullus delectus.', 0, 'inactive', '2024-11-12 16:35:34');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (31, null, 21, 1, 'Exercitationem tergiversatio theologus aperte eligendi vergo abstergo cur delicate.', 0, 'active', '2024-10-29 05:57:49');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (32, null, 20, 2, 'Uberrime velit curtus demulceo amoveo depromo eveniet spiritus.', 1, 'active', '2024-07-05 21:55:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (33, null, 11, 6, 'A utrum cunctatio vespillo trans vinum.', 1, 'active', '2024-06-24 09:15:51');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (34, null, 21, 6, 'Apostolus ventito adduco tabernus cruentus cibus modi.', 0, 'inactive', '2024-08-03 14:51:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (35, null, 1, 5, 'Tollo adiuvo adhuc.', 0, 'active', '2024-09-23 09:24:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (36, null, 10, 8, 'Thymum vester laboriosam damnatio vinco tepesco.', 0, 'active', '2024-08-11 21:42:03');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (37, null, 8, 7, 'Vero uter minus appositus speculum pecus acidus sperno in.', 0, 'active', '2024-03-02 21:58:46');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (38, null, 4, 8, 'Ustulo alii maiores pecto bene contra speculum caelum.', 1, 'active', '2024-02-18 07:42:42');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (39, null, 21, 3, 'Amplus tactus sum demum thesis assumenda dolorem.', 0, 'inactive', '2024-05-07 19:50:46');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (40, null, 2, 5, 'Dolores cognomen cauda suasoria ater ater sui demergo.', 0, 'active', '2024-04-29 00:39:35');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (41, null, 24, 4, 'Vobis calamitas crepusculum blandior suffoco quos vulnus denuo.', 1, 'active', '2024-05-26 08:06:53');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (42, null, 18, 7, 'Vigor cui animadverto vociferor trepide supellex absum undique tenax.', 0, 'inactive', '2024-09-13 10:45:32');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (43, null, 16, 3, 'Odio repudiandae appono facilis creta excepturi constans defero ipsum non.', 0, 'inactive', '2024-08-01 08:23:49');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (44, null, 1, 2, 'Vinum nemo depraedor terebro cur.', 0, 'active', '2024-04-29 06:22:43');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (45, null, 15, 1, 'Deserunt strenuus amplus conscendo caveo depono aro tredecim surgo.', 0, 'active', '2024-07-29 04:44:36');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (46, null, 6, 5, 'Videlicet nam cras cunabula deripio.', 0, 'active', '2024-09-13 15:42:27');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (47, null, 15, 7, 'Atavus deduco earum expedita cariosus commemoro vomer uxor.', 0, 'active', '2024-05-23 18:03:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (48, null, 6, 5, 'Aliqua sed dolore sub temptatio clarus stips stipes viscus tempus.', 0, 'active', '2024-08-08 05:50:30');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (49, null, 7, 6, 'Vociferor pax advoco sodalitas mollitia vir.', 0, 'active', '2024-09-26 15:03:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (50, null, 10, 3, 'Vos theatrum carus alienus adflicto viriliter.', 0, 'active', '2024-01-17 07:34:57');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (51, 49, 8, 1, 'Cogo avaritia arbustum arma termes.', 0, 'active', '2024-08-21 23:21:06');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (52, 16, 5, 4, 'Debeo nostrum pectus arcus sto carcer suggero animus torrens ipsa.', 0, 'inactive', '2024-04-05 20:35:32');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (53, 36, 12, 3, 'Depereo trucido placeat acies statua pauci viduo cibo valens.', 0, 'inactive', '2024-01-01 18:45:25');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (55, 46, 24, 5, 'Subseco tactus venustas comedo.', 0, 'active', '2024-01-21 04:25:08');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (56, 24, 11, 2, 'Velum cubitum vilitas sui avarus caterva.', 0, 'active', '2024-10-25 20:59:50');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (57, 5, 8, 5, 'Curo thorax nihil tolero vulgus sum vinitor territo terga.', 0, 'active', '2024-10-26 05:24:38');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (58, 41, 15, 3, 'Vigor ea tactus suspendo deleniti speciosus thorax trepide.', 0, 'active', '2024-09-04 16:37:09');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (59, 38, 2, 5, 'Peior absens ter temperantia coniuratio cohaero assentator videlicet optio.', 0, 'active', '2024-01-04 22:13:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (60, 35, 24, 6, 'Ventito amissio ea video custodia tamisium amor desparatus vix aspernatur.', 0, 'inactive', '2024-07-27 16:55:38');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (61, 40, 12, 5, 'Aranea arto aut rerum creber varius quidem substantia.', 0, 'inactive', '2024-10-06 14:13:48');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (62, 37, 16, 8, 'Tergo ambitus averto socius facere adiuvo.', 0, 'active', '2024-02-01 09:50:06');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (63, 22, 10, 7, 'Asporto eius velit uterque pauper ceno ater turbo talio clibanus.', 0, 'active', '2024-02-21 16:17:40');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (64, 12, 12, 2, 'Acidus vorax ad appositus ubi capto eveniet provident tabesco dolorum.', 0, 'inactive', '2024-10-31 09:25:44');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (65, 50, 2, 3, 'Cunae aspernatur degusto currus.', 0, 'active', '2024-07-06 14:23:12');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (66, 47, 9, 7, 'Accusamus vulariter crudelis neque esse commodi.', 0, 'active', '2024-09-29 23:26:46');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (67, 50, 24, 5, 'Sunt vivo cogito cribro vespillo voveo defleo aut sto cogito.', 0, 'active', '2024-07-24 06:34:28');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (68, 48, 1, 1, 'Adopto quaerat curto amplitudo.', 0, 'inactive', '2024-03-25 17:41:02');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (69, 8, 3, 4, 'Voveo adulatio delego.', 0, 'inactive', '2024-01-17 11:33:01');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (70, 1, 2, 7, 'Crux texo cubitum.', 0, 'active', '2024-03-28 05:37:44');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (71, 14, 25, 5, 'Demulceo tremo trado qui.', 0, 'active', '2024-10-23 09:37:17');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (72, 21, 8, 2, 'Occaecati cogo deputo.', 0, 'active', '2024-01-31 13:29:55');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (73, 44, 11, 8, 'Enim talis cotidie alias thema clementia abundans sonitus.', 0, 'active', '2024-10-30 06:04:50');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (74, 19, 14, 6, 'Uxor turba admoneo cerno ipsa.', 0, 'active', '2024-10-14 16:00:06');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (75, 46, 23, 1, 'Animus ager patior candidus crapula.', 0, 'active', '2024-08-10 17:19:31');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (76, 29, 12, 2, 'Cilicium vestrum tenax ratione.', 0, 'active', '2024-01-05 21:37:11');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (77, 37, 24, 1, 'Esse colligo communis debitis decretum.', 0, 'active', '2024-05-21 03:09:35');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (78, 42, 23, 4, 'Annus itaque cunabula uredo veritatis.', 0, 'active', '2024-07-04 14:00:48');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (79, 46, 6, 5, 'Demonstro tristis comptus succedo adimpleo astrum conor.', 0, 'active', '2024-01-17 01:56:55');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (80, 47, 11, 6, 'Explicabo teres aliquam bene crudelis aegre.', 0, 'active', '2024-02-16 16:21:02');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (81, 17, 8, 7, 'Conqueror surgo cruentus versus assentator.', 0, 'active', '2024-06-28 09:31:19');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (82, 19, 16, 6, 'Amet caecus adsum arma synagoga argentum casus degusto dolore.', 0, 'active', '2024-06-25 18:28:02');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (83, 49, 15, 8, 'Volva tabgo armarium candidus cohibeo casso aeger textus complectus suus.', 0, 'active', '2024-02-02 03:14:40');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (84, 49, 8, 8, 'Vix cerno corroboro capto somnus venio condico debeo.', 0, 'active', '2024-07-29 00:05:23');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (85, 50, 14, 4, 'Temperantia facilis tabella coaegresco degero blandior solium ubi attero mollitia.', 0, 'active', '2024-01-14 05:44:33');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (86, 25, 19, 3, 'Cimentarius tollo cultellus pax verecundia caterva decor.', 0, 'active', '2024-08-10 09:13:35');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (87, 37, 12, 6, 'Cur campana spectaculum vulgo ventus damno damno comedo tot.', 0, 'active', '2024-07-16 22:30:27');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (88, 35, 4, 7, 'Cursus abscido recusandae vulticulus inflammatio vinculum possimus cupressus curiositas.', 0, 'inactive', '2024-05-19 16:36:56');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (89, 39, 12, 3, 'Degenero deleniti saepe curriculum cubitum.', 0, 'active', '2024-09-24 14:12:09');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (90, 16, 19, 3, 'Similique blandior colo cunae aduro adicio conculco.', 0, 'inactive', '2024-07-30 15:16:17');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (91, 16, 2, 3, 'Commodo vomer volutabrum appositus molestiae.', 0, 'active', '2024-07-18 03:59:33');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (92, 38, 24, 8, 'Ullam appositus impedit tredecim illo repellat decumbo doloribus crustulum.', 0, 'inactive', '2024-08-25 23:38:49');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (93, 36, 14, 7, 'Crudelis adsum beneficium ait ulterius dapifer debitis excepturi.', 0, 'active', '2024-10-29 01:12:50');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (94, 46, 2, 4, 'Audeo autem nemo labore aliqua canto reiciendis arguo.', 0, 'inactive', '2024-07-22 14:15:37');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (95, 41, 22, 3, 'Conduco artificiose urbanus beatae sed apparatus.', 0, 'active', '2024-07-17 15:59:34');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (96, 40, 8, 1, 'Vere caelum abstergo ratione sustineo audeo asperiores complectus.', 0, 'active', '2024-09-23 03:08:39');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (97, 36, 24, 3, 'Adicio supra aro tripudio statim vos.', 0, 'active', '2024-05-31 08:57:47');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (98, 42, 17, 6, 'Depono amiculum auctus turpis.', 0, 'inactive', '2024-09-28 22:59:13');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (99, 6, 18, 1, 'Valens ventus coadunatio temeritas arto.', 0, 'active', '2024-06-25 07:47:54');
INSERT INTO comments (id, commentId, postId, creationById, content, isHelpful, status, creationAt) VALUES (100, 34, 12, 4, 'Casus acerbitas defaeco pariatur cubo sustineo.', 0, 'active', '2024-02-09 10:39:21');

/* Likes */
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (1, 7, 8, null, 'like', '2024-02-18 22:03:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (2, 8, 8, null, 'like', '2024-10-06 10:43:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (3, 4, 17, null, 'like', '2024-07-16 01:44:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5, 8, 12, null, 'like', '2024-04-12 03:40:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6, 6, 5, null, 'like', '2024-06-29 05:02:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (7, 3, 22, null, 'dislike', '2024-11-07 22:18:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (8, 7, 4, null, 'like', '2024-08-16 11:42:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (9, 3, 9, null, 'like', '2024-05-12 09:29:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (10, 5, 15, null, 'like', '2024-06-24 21:23:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (12, 4, 21, null, 'dislike', '2024-08-20 11:55:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (13, 7, 11, null, 'like', '2024-03-31 05:19:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (14, 2, 14, null, 'like', '2024-08-19 07:36:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (15, 1, 19, null, 'dislike', '2024-10-28 09:04:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (16, 8, 10, null, 'like', '2024-02-12 23:39:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (17, 3, 6, null, 'like', '2024-09-14 23:22:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (18, 6, 6, null, 'like', '2024-05-28 14:16:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (20, 1, 1, null, 'like', '2024-01-29 14:12:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (21, 4, 1, null, 'like', '2024-06-17 18:32:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (22, 6, 24, null, 'like', '2024-11-02 20:06:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (23, 8, 2, null, 'like', '2024-02-11 12:48:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (24, 8, 4, null, 'like', '2024-07-28 17:35:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (25, 4, 16, null, 'like', '2024-06-08 13:28:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (26, 5, 18, null, 'dislike', '2024-01-22 19:15:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (27, 8, 6, null, 'like', '2024-10-28 22:37:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (28, 5, 1, null, 'like', '2024-02-06 16:41:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (29, 2, 12, null, 'like', '2024-10-31 09:03:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (30, 6, 19, null, 'dislike', '2024-09-17 06:13:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (31, 3, 2, null, 'like', '2024-09-24 11:12:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (32, 1, 17, null, 'like', '2024-10-12 03:02:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (34, 7, 25, null, 'dislike', '2024-05-31 10:26:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (35, 2, 9, null, 'like', '2024-09-16 23:52:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (36, 5, 13, null, 'like', '2024-04-03 15:40:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (37, 1, 4, null, 'like', '2024-10-11 03:42:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (38, 8, 21, null, 'like', '2024-03-26 08:10:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (39, 5, 4, null, 'like', '2024-06-08 12:51:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (40, 7, 21, null, 'dislike', '2024-05-27 05:14:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (41, 6, 9, null, 'like', '2024-09-15 05:14:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (42, 2, 18, null, 'dislike', '2024-09-12 06:31:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (43, 3, 8, null, 'like', '2024-01-24 03:39:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (44, 6, 20, null, 'like', '2024-04-01 02:59:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45, 7, 12, null, 'like', '2024-06-15 18:01:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (46, 8, 14, null, 'like', '2024-01-26 12:23:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (47, 3, 19, null, 'like', '2024-10-04 15:43:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (48, 7, 10, null, 'like', '2024-07-23 15:04:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (49, 2, 25, null, 'dislike', '2024-02-02 09:40:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (50, 7, 24, null, 'dislike', '2024-03-15 13:59:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (51, 4, 9, null, 'like', '2024-06-23 16:54:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (52, 4, 14, null, 'like', '2024-09-02 19:08:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (53, 5, 16, null, 'like', '2024-06-04 01:33:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (56, 6, 13, null, 'like', '2024-11-04 20:23:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (57, 2, 16, null, 'like', '2024-01-21 12:02:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (58, 4, 7, null, 'like', '2024-01-26 03:14:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (59, 7, 23, null, 'like', '2024-03-08 04:34:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (60, 8, 3, null, 'like', '2024-07-18 12:33:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (61, 1, 18, null, 'like', '2024-10-09 19:50:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (62, 1, 22, null, 'like', '2024-01-20 12:47:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (64, 6, 22, null, 'like', '2024-08-27 18:27:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (65, 1, 3, null, 'like', '2024-04-21 02:22:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (66, 1, 11, null, 'like', '2024-05-17 05:24:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (67, 1, 20, null, 'like', '2024-08-22 18:50:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (68, 2, 19, null, 'dislike', '2024-10-15 08:43:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (69, 5, 22, null, 'dislike', '2024-02-20 02:45:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (71, 2, 1, null, 'like', '2024-07-04 02:02:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (72, 8, 5, null, 'like', '2024-09-30 17:33:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (73, 5, 8, null, 'like', '2024-05-03 19:39:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (77, 8, 25, null, 'like', '2024-05-23 04:11:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (79, 4, 12, null, 'like', '2024-03-14 01:09:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (80, 1, 21, null, 'like', '2024-06-09 15:22:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (82, 4, 2, null, 'like', '2024-10-01 11:25:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (83, 7, 20, null, 'dislike', '2024-07-29 14:32:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (84, 1, 14, null, 'like', '2024-04-12 13:59:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (85, 3, 11, null, 'like', '2024-08-13 02:36:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (86, 4, 23, null, 'dislike', '2024-09-07 21:03:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (87, 6, 14, null, 'like', '2024-02-28 21:35:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (88, 4, 19, null, 'like', '2024-11-01 22:14:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (89, 2, 22, null, 'dislike', '2024-07-06 12:51:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (91, 4, 5, null, 'like', '2024-06-22 01:38:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (92, 4, 10, null, 'like', '2024-08-17 19:45:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (95, 8, 18, null, 'like', '2024-10-29 15:05:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (96, 5, 12, null, 'like', '2024-04-06 06:06:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (97, 5, 14, null, 'like', '2024-10-24 07:02:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (101, 1, 23, null, 'like', '2024-04-04 11:50:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (104, 5, 20, null, 'dislike', '2024-01-19 00:02:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (105, 2, 2, null, 'like', '2024-02-16 03:41:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (106, 3, 7, null, 'like', '2024-08-27 07:58:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (107, 1, 2, null, 'like', '2024-06-09 14:06:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (109, 1, 10, null, 'like', '2024-02-04 07:55:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (111, 6, 3, null, 'like', '2024-10-23 18:57:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (113, 5, 3, null, 'like', '2024-07-03 12:13:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (115, 1, 8, null, 'like', '2024-09-08 19:32:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (117, 4, 25, null, 'dislike', '2024-09-15 15:29:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (118, 7, 6, null, 'like', '2024-08-15 12:32:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (119, 4, 24, null, 'like', '2024-02-12 02:55:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (120, 6, 7, null, 'like', '2024-03-12 06:53:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (122, 4, 15, null, 'like', '2024-05-24 19:07:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (123, 7, 5, null, 'like', '2024-06-11 04:12:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (124, 7, 7, null, 'like', '2024-06-21 11:31:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (131, 1, 7, null, 'like', '2024-11-02 11:47:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (135, 7, 15, null, 'like', '2024-06-25 00:59:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (139, 6, 16, null, 'like', '2024-07-04 07:24:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (143, 2, 13, null, 'like', '2024-05-26 12:24:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (144, 4, 6, null, 'like', '2024-10-27 13:22:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (146, 1, 6, null, 'like', '2024-07-09 02:28:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (152, 5, 19, null, 'dislike', '2024-10-19 01:14:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (154, 3, 18, null, 'like', '2024-09-14 02:42:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (157, 4, 22, null, 'like', '2024-02-13 00:13:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (159, 2, 24, null, 'like', '2024-10-31 22:27:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (162, 6, 10, null, 'like', '2024-01-10 06:25:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (163, 3, 3, null, 'like', '2024-04-03 01:27:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (169, 8, 24, null, 'like', '2024-01-13 09:43:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (173, 3, 17, null, 'like', '2024-08-22 07:49:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (174, 8, 20, null, 'like', '2024-10-09 14:46:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (175, 5, 7, null, 'like', '2024-11-15 21:09:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (176, 1, 12, null, 'like', '2024-05-14 14:57:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (178, 8, 19, null, 'dislike', '2024-03-07 13:49:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (180, 6, 18, null, 'dislike', '2024-11-15 19:11:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (184, 6, 15, null, 'like', '2024-06-24 07:29:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (186, 8, 7, null, 'like', '2024-08-29 19:53:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (190, 7, 2, null, 'like', '2024-10-08 13:30:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (191, 6, 25, null, 'like', '2024-06-09 17:24:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (195, 3, 23, null, 'like', '2024-02-22 18:28:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (196, 8, 13, null, 'like', '2024-01-06 10:00:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (198, 1, 16, null, 'like', '2024-03-31 02:21:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (199, 3, 16, null, 'like', '2024-02-04 03:35:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (212, 6, 2, null, 'like', '2024-08-16 11:14:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (214, 2, 3, null, 'like', '2024-03-20 12:07:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (225, 3, 10, null, 'like', '2024-06-24 16:20:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (231, 2, 4, null, 'like', '2024-05-22 16:15:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (238, 6, 17, null, 'dislike', '2024-07-01 08:26:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (239, 7, 19, null, 'dislike', '2024-02-04 02:46:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (243, 2, 6, null, 'like', '2024-10-07 17:30:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (247, 5, 2, null, 'like', '2024-01-21 17:31:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (248, 6, 12, null, 'like', '2024-08-27 08:10:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (257, 5, 9, null, 'like', '2024-07-25 12:45:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (259, 5, 11, null, 'like', '2024-05-12 20:32:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (268, 2, 17, null, 'like', '2024-09-27 07:34:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (269, 2, 7, null, 'like', '2024-08-06 16:20:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (274, 1, 24, null, 'like', '2024-08-14 21:30:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (275, 6, 4, null, 'like', '2024-01-12 17:50:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (276, 6, 8, null, 'like', '2024-05-14 16:38:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (278, 3, 5, null, 'like', '2024-05-11 19:18:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (281, 7, 3, null, 'like', '2024-07-26 11:22:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (293, 5, 17, null, 'dislike', '2024-11-11 07:02:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (294, 8, 11, null, 'like', '2024-08-24 09:16:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (296, 2, 21, null, 'dislike', '2024-05-14 19:24:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (299, 6, 1, null, 'like', '2024-11-03 07:24:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (300, 1, 15, null, 'like', '2024-08-18 16:01:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (305, 1, 25, null, 'like', '2024-09-28 11:19:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (312, 2, 5, null, 'like', '2024-07-11 07:01:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (313, 7, 18, null, 'dislike', '2024-04-02 09:34:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (317, 7, 14, null, 'like', '2024-03-04 23:57:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (321, 4, 3, null, 'like', '2024-01-03 00:48:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (332, 6, 11, null, 'like', '2024-09-26 17:25:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (334, 7, 22, null, 'dislike', '2024-02-03 00:37:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (341, 3, 21, null, 'like', '2024-01-23 01:23:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (346, 5, 6, null, 'like', '2024-06-05 02:07:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (348, 3, 25, null, 'dislike', '2024-05-21 22:18:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (355, 4, 20, null, 'dislike', '2024-01-06 03:50:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (360, 4, 8, null, 'like', '2024-09-05 23:30:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (361, 4, 13, null, 'like', '2024-07-27 05:15:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (369, 1, 13, null, 'like', '2024-04-02 08:08:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (376, 3, 15, null, 'like', '2024-02-24 18:29:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (389, 2, 15, null, 'like', '2024-06-09 13:03:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (391, 3, 1, null, 'like', '2024-05-30 11:13:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (392, 7, 17, null, 'like', '2024-09-17 01:32:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (395, 6, 21, null, 'like', '2024-01-10 04:21:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (410, 8, 22, null, 'like', '2024-01-07 04:45:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (427, 8, 15, null, 'like', '2024-01-28 18:31:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (432, 3, 24, null, 'like', '2024-03-31 07:07:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (439, 6, 23, null, 'like', '2024-10-20 19:13:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (445, 2, 20, null, 'dislike', '2024-08-08 13:42:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (447, 1, 5, null, 'like', '2024-02-05 06:58:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (463, 7, 1, null, 'like', '2024-01-30 05:50:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (468, 2, 8, null, 'like', '2024-01-20 10:57:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (482, 7, 13, null, 'like', '2024-02-07 15:33:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (488, 8, 9, null, 'like', '2024-07-08 18:33:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (494, 4, 4, null, 'like', '2024-02-01 13:23:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (520, 8, 17, null, 'like', '2024-04-12 06:01:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (530, 5, 25, null, 'dislike', '2024-10-30 13:03:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (567, 7, 16, null, 'like', '2024-08-30 23:04:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (635, 2, 23, null, 'like', '2024-09-03 06:26:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (665, 8, 1, null, 'like', '2024-05-26 03:45:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (673, 8, 16, null, 'like', '2024-02-19 20:03:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (685, 2, 10, null, 'like', '2024-06-01 08:26:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (689, 8, 23, null, 'like', '2024-06-06 02:42:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (718, 3, 4, null, 'like', '2024-10-11 18:45:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (720, 5, 23, null, 'like', '2024-02-02 13:52:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (730, 1, 9, null, 'like', '2024-11-09 22:35:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (759, 5, 5, null, 'like', '2024-01-10 17:02:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (842, 5, 10, null, 'like', '2024-08-18 10:16:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5001, 5, null, 42, 'dislike', '2024-05-28 03:53:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5002, 7, null, 7, 'like', '2024-03-17 15:55:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5003, 6, null, 17, 'like', '2024-09-02 02:47:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5004, 4, null, 12, 'like', '2024-06-17 22:27:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5005, 8, null, 17, 'like', '2024-03-19 20:00:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5006, 4, null, 24, 'like', '2024-02-23 23:09:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5007, 3, null, 49, 'like', '2024-09-10 05:58:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5008, 1, null, 10, 'like', '2024-02-18 06:01:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5009, 1, null, 14, 'like', '2024-10-19 18:19:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5010, 7, null, 42, 'dislike', '2024-03-19 00:39:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5011, 4, null, 5, 'dislike', '2024-03-02 13:14:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5012, 2, null, 3, 'like', '2024-07-01 05:02:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5013, 6, null, 3, 'like', '2024-06-29 11:12:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5014, 7, null, 11, 'like', '2024-01-30 14:13:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5015, 7, null, 14, 'like', '2024-09-26 22:30:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5016, 4, null, 33, 'like', '2024-07-27 21:47:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5017, 4, null, 42, 'dislike', '2024-05-12 14:04:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5018, 2, null, 23, 'like', '2024-06-29 14:11:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5019, 8, null, 30, 'like', '2024-06-14 04:29:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5020, 4, null, 38, 'like', '2024-03-23 22:53:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5021, 8, null, 45, 'like', '2024-10-14 08:08:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5022, 7, null, 46, 'like', '2024-03-17 02:52:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5023, 2, null, 28, 'like', '2024-07-24 13:01:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5024, 8, null, 23, 'like', '2024-09-26 19:08:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5025, 5, null, 28, 'like', '2024-04-04 05:05:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5026, 7, null, 28, 'like', '2024-02-07 15:57:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5028, 8, null, 47, 'like', '2024-04-16 20:57:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5029, 7, null, 4, 'like', '2024-01-03 23:12:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5030, 3, null, 12, 'like', '2024-01-15 01:41:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5031, 5, null, 49, 'dislike', '2024-10-13 02:01:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5033, 3, null, 48, 'like', '2024-02-23 17:31:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5034, 5, null, 33, 'like', '2024-01-24 18:59:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5035, 2, null, 4, 'like', '2024-08-05 02:49:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5036, 5, null, 47, 'dislike', '2024-01-15 14:57:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5037, 1, null, 19, 'like', '2024-04-27 03:00:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5038, 6, null, 11, 'like', '2024-01-14 16:31:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5040, 1, null, 8, 'like', '2024-11-15 02:14:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5042, 3, null, 30, 'like', '2024-01-20 05:16:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5043, 4, null, 20, 'like', '2024-04-14 20:50:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5044, 5, null, 1, 'like', '2024-10-10 21:02:34');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5045, 4, null, 11, 'like', '2024-10-23 05:45:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5046, 6, null, 30, 'like', '2024-07-27 20:28:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5047, 8, null, 35, 'like', '2024-02-15 21:57:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5048, 1, null, 29, 'like', '2024-09-05 02:47:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5049, 5, null, 5, 'like', '2024-03-31 16:59:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5050, 7, null, 21, 'like', '2024-07-25 06:57:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5051, 4, null, 27, 'like', '2024-02-06 23:17:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5053, 2, null, 34, 'like', '2024-05-14 14:47:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5054, 8, null, 26, 'like', '2024-04-01 22:12:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5055, 4, null, 28, 'like', '2024-10-10 11:04:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5056, 3, null, 11, 'like', '2024-09-11 19:32:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5057, 1, null, 47, 'dislike', '2024-02-10 09:22:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5058, 2, null, 6, 'like', '2024-02-29 02:53:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5059, 7, null, 10, 'like', '2024-06-04 16:48:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5060, 8, null, 20, 'like', '2024-10-05 19:36:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5062, 3, null, 1, 'like', '2024-02-20 08:42:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5063, 1, null, 39, 'like', '2024-10-08 08:12:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5064, 8, null, 43, 'dislike', '2024-01-08 16:36:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5065, 3, null, 24, 'like', '2024-09-14 16:28:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5067, 7, null, 13, 'like', '2024-02-14 02:21:18');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5068, 6, null, 5, 'like', '2024-07-10 17:09:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5069, 1, null, 5, 'like', '2024-07-18 23:50:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5070, 3, null, 38, 'like', '2024-10-01 16:12:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5071, 3, null, 46, 'like', '2024-04-04 21:12:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5074, 1, null, 36, 'like', '2024-03-26 20:21:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5075, 1, null, 45, 'like', '2024-02-12 15:26:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5076, 7, null, 39, 'like', '2024-09-24 06:01:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5077, 8, null, 9, 'dislike', '2024-03-06 09:34:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5078, 8, null, 48, 'like', '2024-04-01 23:25:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5079, 2, null, 17, 'like', '2024-01-03 12:44:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5080, 2, null, 30, 'like', '2024-09-14 03:48:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5082, 6, null, 16, 'like', '2024-09-24 05:59:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5083, 1, null, 37, 'like', '2024-04-05 08:55:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5085, 3, null, 44, 'like', '2024-07-15 03:00:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5086, 2, null, 26, 'like', '2024-01-15 11:00:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5087, 1, null, 40, 'like', '2024-09-16 16:07:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5090, 7, null, 44, 'dislike', '2024-03-20 02:45:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5091, 6, null, 4, 'like', '2024-06-08 21:37:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5092, 7, null, 5, 'like', '2024-09-24 00:37:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5093, 6, null, 45, 'like', '2024-03-01 03:05:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5094, 3, null, 21, 'like', '2024-07-08 19:24:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5095, 1, null, 32, 'like', '2024-03-16 17:51:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5096, 4, null, 17, 'like', '2024-01-08 14:07:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5098, 7, null, 37, 'like', '2024-03-30 13:51:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5099, 2, null, 35, 'like', '2024-07-17 09:54:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5100, 7, null, 9, 'like', '2024-03-18 23:45:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5101, 4, null, 13, 'like', '2024-09-27 17:45:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5102, 3, null, 36, 'like', '2024-05-11 18:38:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5103, 7, null, 34, 'like', '2024-01-17 20:32:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5104, 6, null, 24, 'like', '2024-06-22 10:57:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5105, 3, null, 17, 'like', '2024-02-17 10:28:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5106, 6, null, 21, 'like', '2024-05-11 15:20:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5108, 6, null, 8, 'like', '2024-08-21 13:04:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5109, 1, null, 38, 'like', '2024-03-25 23:56:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5110, 8, null, 13, 'like', '2024-02-15 01:53:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5112, 6, null, 46, 'dislike', '2024-08-29 14:30:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5113, 5, null, 46, 'dislike', '2024-08-09 09:43:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5114, 8, null, 41, 'like', '2024-07-24 23:43:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5116, 2, null, 24, 'like', '2024-03-22 13:57:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5117, 2, null, 25, 'like', '2024-08-06 05:50:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5118, 1, null, 21, 'like', '2024-02-03 04:08:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5119, 1, null, 44, 'dislike', '2024-09-23 01:47:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5120, 6, null, 25, 'like', '2024-07-02 02:09:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5122, 3, null, 50, 'dislike', '2024-09-14 16:48:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5123, 4, null, 37, 'like', '2024-07-06 21:16:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5124, 1, null, 25, 'like', '2024-08-28 20:36:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5125, 6, null, 36, 'like', '2024-02-15 23:22:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5126, 5, null, 4, 'like', '2024-08-07 08:56:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5128, 7, null, 3, 'like', '2024-01-14 14:54:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5129, 1, null, 33, 'like', '2024-07-16 12:09:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5132, 8, null, 31, 'like', '2024-06-15 21:02:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5133, 8, null, 2, 'like', '2024-11-06 07:53:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5134, 8, null, 32, 'like', '2024-10-28 08:34:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5135, 3, null, 35, 'like', '2024-05-24 01:08:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5136, 3, null, 29, 'like', '2024-01-29 18:34:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5137, 3, null, 39, 'like', '2024-04-27 16:43:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5139, 5, null, 17, 'like', '2024-03-11 13:43:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5143, 3, null, 34, 'like', '2024-08-23 08:56:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5144, 6, null, 38, 'like', '2024-03-08 20:20:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5145, 5, null, 38, 'like', '2024-11-03 17:52:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5147, 1, null, 28, 'like', '2024-04-20 23:06:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5148, 3, null, 45, 'dislike', '2024-06-16 09:58:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5149, 8, null, 16, 'like', '2024-02-26 15:40:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5152, 8, null, 8, 'dislike', '2024-01-25 05:12:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5153, 2, null, 27, 'like', '2024-08-27 10:34:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5154, 8, null, 44, 'like', '2024-03-18 01:22:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5157, 4, null, 18, 'like', '2024-04-12 14:03:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5158, 5, null, 45, 'dislike', '2024-10-21 17:59:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5159, 8, null, 28, 'like', '2024-11-08 06:47:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5160, 8, null, 3, 'like', '2024-03-12 07:58:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5161, 2, null, 43, 'dislike', '2024-10-11 05:58:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5162, 4, null, 32, 'like', '2024-03-08 08:36:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5164, 6, null, 12, 'like', '2024-08-09 08:01:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5165, 6, null, 7, 'like', '2024-02-12 04:26:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5166, 1, null, 22, 'like', '2024-06-16 10:48:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5167, 2, null, 36, 'like', '2024-07-09 16:20:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5168, 6, null, 41, 'dislike', '2024-10-17 21:39:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5169, 1, null, 6, 'like', '2024-10-26 18:50:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5170, 4, null, 22, 'like', '2024-10-13 00:50:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5171, 1, null, 24, 'like', '2024-02-24 20:37:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5174, 6, null, 15, 'like', '2024-05-26 02:58:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5178, 5, null, 34, 'like', '2024-01-16 06:18:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5182, 4, null, 45, 'like', '2024-09-15 13:02:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5185, 2, null, 45, 'like', '2024-01-19 18:26:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5187, 6, null, 6, 'like', '2024-02-29 13:35:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5189, 3, null, 4, 'like', '2024-07-27 12:28:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5190, 3, null, 8, 'like', '2024-10-26 07:58:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5191, 3, null, 7, 'like', '2024-08-12 13:36:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5192, 6, null, 10, 'like', '2024-06-19 06:29:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5193, 1, null, 31, 'like', '2024-07-24 10:09:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5194, 1, null, 15, 'like', '2024-05-16 16:58:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5195, 2, null, 31, 'like', '2024-04-30 10:44:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5199, 8, null, 36, 'like', '2024-05-15 09:00:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5203, 8, null, 27, 'like', '2024-03-05 22:31:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5204, 3, null, 41, 'like', '2024-09-20 10:20:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5207, 7, null, 36, 'like', '2024-05-09 08:27:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5208, 6, null, 29, 'like', '2024-01-18 14:16:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5211, 6, null, 50, 'dislike', '2024-09-15 20:25:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5212, 8, null, 46, 'dislike', '2024-09-10 05:43:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5214, 5, null, 2, 'like', '2024-07-29 14:44:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5217, 5, null, 25, 'like', '2024-10-28 11:14:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5219, 8, null, 50, 'like', '2024-08-04 08:01:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5224, 3, null, 19, 'like', '2024-07-26 07:48:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5225, 5, null, 24, 'like', '2024-08-16 06:30:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5226, 1, null, 2, 'like', '2024-11-13 22:47:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5227, 4, null, 10, 'like', '2024-02-19 21:02:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5230, 8, null, 38, 'like', '2024-05-03 09:35:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5231, 2, null, 12, 'like', '2024-09-17 05:04:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5233, 6, null, 39, 'like', '2024-04-30 20:22:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5237, 4, null, 21, 'like', '2024-07-01 22:27:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5238, 2, null, 41, 'dislike', '2024-02-12 05:13:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5239, 8, null, 39, 'like', '2024-04-17 19:40:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5240, 4, null, 15, 'like', '2024-02-05 19:17:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5242, 4, null, 39, 'like', '2024-02-23 00:21:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5244, 4, null, 48, 'dislike', '2024-08-24 17:42:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5247, 5, null, 26, 'like', '2024-08-27 05:12:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5248, 7, null, 38, 'like', '2024-07-31 14:50:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5249, 3, null, 37, 'like', '2024-10-18 15:23:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5250, 8, null, 7, 'like', '2024-06-18 22:57:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5253, 4, null, 50, 'like', '2024-01-23 13:43:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5254, 3, null, 31, 'like', '2024-01-25 14:32:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5256, 5, null, 35, 'like', '2024-03-18 16:54:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5257, 8, null, 1, 'like', '2024-09-06 15:55:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5258, 3, null, 9, 'like', '2024-11-15 08:07:28');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5259, 6, null, 9, 'like', '2024-05-07 09:01:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5260, 6, null, 44, 'dislike', '2024-06-04 14:14:02');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5264, 5, null, 43, 'like', '2024-06-21 11:04:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5266, 7, null, 50, 'like', '2024-11-13 02:18:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5267, 1, null, 48, 'like', '2024-02-22 08:38:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5268, 7, null, 22, 'like', '2024-06-27 11:22:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5270, 4, null, 31, 'like', '2024-09-09 11:40:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5272, 2, null, 37, 'like', '2024-06-09 05:20:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5274, 6, null, 22, 'like', '2024-11-15 01:29:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5275, 5, null, 40, 'like', '2024-04-14 02:55:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5284, 2, null, 8, 'like', '2024-06-08 01:35:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5285, 2, null, 29, 'like', '2024-10-15 07:01:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5286, 7, null, 18, 'like', '2024-01-25 14:10:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5287, 3, null, 10, 'like', '2024-08-17 22:13:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5288, 4, null, 26, 'like', '2024-09-18 21:49:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5290, 7, null, 48, 'dislike', '2024-06-08 08:31:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5292, 4, null, 23, 'like', '2024-02-25 16:12:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5293, 1, null, 41, 'dislike', '2024-07-06 06:40:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5294, 6, null, 18, 'like', '2024-06-11 23:41:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5295, 7, null, 17, 'like', '2024-06-01 19:03:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5296, 7, null, 30, 'like', '2024-05-17 14:34:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5297, 8, null, 19, 'like', '2024-10-16 12:09:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5301, 3, null, 3, 'like', '2024-08-01 04:47:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5302, 2, null, 49, 'dislike', '2024-11-15 06:01:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5304, 2, null, 32, 'like', '2024-02-03 08:04:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5305, 6, null, 28, 'like', '2024-08-16 07:57:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5306, 1, null, 1, 'like', '2024-04-20 04:11:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5308, 4, null, 43, 'dislike', '2024-07-06 02:42:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5310, 6, null, 14, 'like', '2024-11-04 05:27:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5311, 1, null, 23, 'like', '2024-07-17 06:56:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5312, 6, null, 1, 'like', '2024-01-21 11:47:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5313, 5, null, 32, 'like', '2024-09-23 18:26:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5314, 6, null, 32, 'like', '2024-07-17 09:55:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5316, 6, null, 20, 'like', '2024-03-16 16:25:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5317, 1, null, 13, 'like', '2024-01-06 10:10:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5319, 4, null, 46, 'like', '2024-07-25 02:14:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5321, 6, null, 48, 'like', '2024-08-27 13:10:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5323, 8, null, 25, 'like', '2024-01-06 18:26:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5326, 4, null, 25, 'like', '2024-08-24 03:15:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5327, 8, null, 6, 'like', '2024-06-09 10:42:45');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5330, 7, null, 23, 'like', '2024-01-26 09:32:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5332, 6, null, 37, 'like', '2024-05-06 09:23:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5333, 5, null, 7, 'like', '2024-01-25 02:06:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5337, 2, null, 42, 'dislike', '2024-07-02 16:19:01');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5338, 2, null, 22, 'like', '2024-02-12 11:39:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5344, 2, null, 7, 'like', '2024-06-11 21:21:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5347, 4, null, 3, 'like', '2024-04-10 00:15:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5349, 7, null, 49, 'like', '2024-06-06 16:47:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5350, 4, null, 47, 'dislike', '2024-08-11 21:28:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5352, 5, null, 44, 'dislike', '2024-04-07 18:53:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5353, 6, null, 42, 'like', '2024-05-16 10:22:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5354, 1, null, 49, 'dislike', '2024-09-03 20:14:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5355, 5, null, 50, 'like', '2024-02-10 14:49:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5356, 8, null, 5, 'like', '2024-04-13 07:33:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5360, 4, null, 30, 'like', '2024-08-23 21:01:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5361, 4, null, 2, 'like', '2024-02-10 12:01:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5365, 2, null, 1, 'like', '2024-08-15 04:40:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5369, 8, null, 12, 'dislike', '2024-07-05 02:34:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5370, 1, null, 17, 'like', '2024-08-31 15:31:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5372, 8, null, 11, 'like', '2024-01-28 18:31:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5374, 2, null, 16, 'like', '2024-07-30 17:18:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5375, 3, null, 22, 'like', '2024-10-19 22:42:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5376, 2, null, 14, 'like', '2024-10-31 20:14:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5381, 2, null, 21, 'like', '2024-04-13 06:05:29');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5382, 4, null, 49, 'like', '2024-10-19 20:54:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5384, 8, null, 14, 'like', '2024-01-01 06:52:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5388, 5, null, 36, 'like', '2024-10-26 13:35:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5393, 3, null, 33, 'like', '2024-08-16 23:06:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5395, 4, null, 4, 'like', '2024-08-20 05:27:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5401, 2, null, 44, 'dislike', '2024-06-08 01:05:41');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5403, 2, null, 38, 'like', '2024-05-27 13:23:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5406, 7, null, 29, 'like', '2024-07-07 11:51:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5409, 5, null, 41, 'like', '2024-01-19 11:57:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5410, 5, null, 11, 'like', '2024-10-07 16:33:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5413, 6, null, 27, 'like', '2024-09-24 10:38:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5414, 3, null, 23, 'like', '2024-07-20 00:53:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5417, 1, null, 34, 'like', '2024-11-04 01:08:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5420, 2, null, 5, 'like', '2024-09-22 00:40:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5422, 6, null, 13, 'like', '2024-06-14 00:55:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5423, 5, null, 30, 'like', '2024-05-23 21:38:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5426, 7, null, 15, 'like', '2024-03-04 05:47:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5429, 5, null, 13, 'like', '2024-08-03 00:08:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5430, 1, null, 3, 'like', '2024-03-05 07:43:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5431, 6, null, 19, 'like', '2024-01-21 19:41:30');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5435, 4, null, 35, 'like', '2024-08-27 03:55:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5437, 8, null, 24, 'like', '2024-04-07 20:13:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5443, 5, null, 3, 'like', '2024-09-13 13:17:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5444, 2, null, 20, 'like', '2024-02-26 11:46:31');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5454, 2, null, 15, 'like', '2024-05-09 18:45:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5461, 2, null, 50, 'dislike', '2024-09-30 06:43:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5472, 7, null, 19, 'like', '2024-05-27 09:51:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5483, 6, null, 33, 'like', '2024-03-09 08:45:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5484, 4, null, 7, 'like', '2024-05-28 19:18:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5487, 4, null, 6, 'dislike', '2024-01-31 17:17:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5488, 6, null, 35, 'like', '2024-01-12 16:28:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5495, 1, null, 16, 'like', '2024-05-09 23:05:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5501, 8, null, 49, 'like', '2024-08-14 03:07:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5504, 7, null, 32, 'like', '2024-05-19 16:29:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5508, 3, null, 16, 'like', '2024-01-05 17:41:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5509, 8, null, 18, 'like', '2024-02-20 07:56:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5513, 7, null, 8, 'like', '2024-11-02 06:40:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5516, 2, null, 46, 'like', '2024-01-21 08:37:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5524, 8, null, 42, 'dislike', '2024-11-06 15:47:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5533, 5, null, 15, 'like', '2024-08-02 00:20:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5535, 4, null, 16, 'like', '2024-04-29 18:01:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5538, 7, null, 25, 'like', '2024-01-16 11:31:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5542, 6, null, 23, 'like', '2024-01-23 05:52:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5545, 8, null, 29, 'like', '2024-08-28 20:32:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5546, 7, null, 27, 'like', '2024-03-09 01:46:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5549, 1, null, 18, 'like', '2024-05-02 20:26:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5551, 3, null, 40, 'dislike', '2024-02-26 03:23:47');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5552, 3, null, 15, 'like', '2024-06-17 22:52:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5553, 7, null, 47, 'like', '2024-06-04 17:07:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5554, 5, null, 16, 'like', '2024-11-12 00:10:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5559, 7, null, 31, 'like', '2024-01-22 06:34:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5560, 4, null, 36, 'like', '2024-09-04 20:01:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5562, 4, null, 1, 'like', '2024-07-11 15:14:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5567, 8, null, 4, 'like', '2024-03-16 18:55:55');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5577, 7, null, 33, 'like', '2024-05-12 21:05:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5578, 3, null, 18, 'like', '2024-06-10 17:55:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5584, 3, null, 42, 'dislike', '2024-06-14 15:35:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5586, 6, null, 47, 'like', '2024-03-18 07:52:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5590, 2, null, 47, 'like', '2024-02-02 03:43:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5599, 3, null, 13, 'like', '2024-08-23 01:36:39');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5601, 1, null, 12, 'like', '2024-01-10 15:12:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5610, 5, null, 19, 'like', '2024-09-25 07:50:38');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5611, 1, null, 11, 'like', '2024-11-05 09:39:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5615, 5, null, 20, 'like', '2024-10-30 20:26:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5616, 2, null, 10, 'like', '2024-10-09 11:53:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5644, 4, null, 29, 'like', '2024-05-12 13:51:50');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5647, 2, null, 40, 'like', '2024-10-20 03:53:19');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5649, 8, null, 21, 'like', '2024-09-23 18:35:04');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5652, 6, null, 2, 'like', '2024-09-11 16:42:58');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5658, 3, null, 14, 'like', '2024-03-20 00:28:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5661, 5, null, 23, 'like', '2024-02-26 04:48:12');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5669, 4, null, 9, 'like', '2024-01-24 20:28:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5672, 7, null, 24, 'like', '2024-10-13 09:22:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5675, 8, null, 33, 'like', '2024-01-13 18:13:13');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5683, 8, null, 34, 'dislike', '2024-10-25 05:14:08');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5687, 4, null, 34, 'like', '2024-11-09 02:15:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5693, 1, null, 7, 'like', '2024-06-02 07:32:54');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5697, 3, null, 27, 'like', '2024-09-06 15:37:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5710, 2, null, 18, 'like', '2024-10-08 01:39:03');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5711, 3, null, 47, 'dislike', '2024-06-17 14:01:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5713, 4, null, 40, 'like', '2024-06-17 12:02:48');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5723, 6, null, 40, 'like', '2024-09-12 02:32:00');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5732, 3, null, 2, 'like', '2024-06-15 21:24:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5736, 1, null, 35, 'like', '2024-04-23 21:13:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5739, 1, null, 42, 'dislike', '2024-06-11 08:22:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5740, 5, null, 37, 'like', '2024-02-03 12:20:57');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5749, 1, null, 50, 'dislike', '2024-04-10 08:22:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5762, 4, null, 44, 'like', '2024-09-06 21:45:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5777, 2, null, 19, 'like', '2024-02-18 06:32:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5792, 2, null, 9, 'like', '2024-08-26 10:30:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5805, 8, null, 40, 'dislike', '2024-10-18 21:01:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5814, 7, null, 43, 'dislike', '2024-09-26 13:13:17');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5819, 1, null, 26, 'like', '2024-05-20 19:34:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5820, 7, null, 6, 'like', '2024-03-29 18:58:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5822, 7, null, 12, 'like', '2024-03-20 02:05:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5825, 8, null, 22, 'like', '2024-07-17 04:56:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5841, 1, null, 9, 'like', '2024-01-06 14:25:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5844, 7, null, 20, 'like', '2024-10-03 11:11:07');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5862, 5, null, 6, 'like', '2024-11-09 19:32:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5870, 6, null, 49, 'like', '2024-07-05 19:13:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5873, 1, null, 27, 'like', '2024-05-26 16:44:42');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5876, 4, null, 8, 'like', '2024-08-15 03:34:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5883, 6, null, 26, 'like', '2024-11-06 23:06:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5888, 5, null, 48, 'like', '2024-01-02 20:42:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5889, 3, null, 43, 'like', '2024-02-16 21:55:52');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5902, 2, null, 2, 'like', '2024-07-30 00:32:35');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5924, 1, null, 46, 'dislike', '2024-06-10 15:04:59');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5931, 5, null, 14, 'like', '2024-02-02 05:20:10');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5932, 3, null, 20, 'like', '2024-08-14 01:19:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5940, 7, null, 1, 'like', '2024-05-27 09:23:25');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5955, 8, null, 10, 'like', '2024-06-19 01:15:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5977, 6, null, 31, 'like', '2024-08-09 08:29:20');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5978, 7, null, 16, 'like', '2024-04-14 16:50:44');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5990, 6, null, 34, 'like', '2024-01-01 03:56:26');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (5995, 4, null, 19, 'like', '2024-01-16 23:03:23');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6043, 5, null, 21, 'like', '2024-10-24 10:55:46');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6077, 6, null, 43, 'like', '2024-02-06 02:01:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6090, 7, null, 45, 'dislike', '2024-08-17 16:21:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6107, 1, null, 20, 'like', '2024-05-28 04:04:56');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6140, 1, null, 43, 'dislike', '2024-10-27 22:30:43');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6168, 7, null, 35, 'like', '2024-06-24 01:10:49');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6242, 4, null, 14, 'like', '2024-01-02 17:10:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6283, 5, null, 27, 'like', '2024-01-30 03:33:27');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6296, 1, null, 30, 'like', '2024-05-16 10:30:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6355, 2, null, 39, 'like', '2024-01-29 16:45:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6402, 1, null, 4, 'like', '2024-04-18 21:01:21');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6414, 5, null, 18, 'like', '2024-05-16 10:04:14');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6423, 2, null, 48, 'dislike', '2024-10-16 03:08:40');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6429, 5, null, 10, 'like', '2024-04-22 13:51:06');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6438, 8, null, 15, 'like', '2024-05-27 05:28:53');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6472, 7, null, 40, 'like', '2024-03-01 14:04:33');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6493, 7, null, 41, 'like', '2024-04-28 04:04:11');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6587, 2, null, 33, 'like', '2024-02-04 10:00:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6598, 2, null, 11, 'like', '2024-06-08 02:22:24');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (6777, 8, null, 37, 'like', '2024-04-05 19:46:37');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (7120, 7, null, 26, 'like', '2024-01-06 06:13:36');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (7424, 7, null, 2, 'like', '2024-03-23 10:57:32');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45002, 4, 18, null, 'like', '2024-11-16 13:40:51');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45003, 3, null, 32, 'like', '2024-11-16 13:42:09');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45004, 3, 20, null, 'like', '2024-11-16 13:45:16');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45005, 2, null, 13, 'dislike', '2024-11-16 14:00:05');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45006, 5, 21, null, 'dislike', '2024-11-16 14:03:15');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45007, 5, null, 29, 'like', '2024-11-16 14:03:22');
INSERT INTO likes (id, creationById, postId, commentId, type, creationAt) VALUES (45008, 4, 11, null, 'dislike', '2024-11-16 14:09:55');

/* END - PROJECT DATA */