--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    user_id integer,
    restaurant_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: cuisine_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuisine_recipe (
    cuisine_id integer,
    recipe_id integer
);


ALTER TABLE public.cuisine_recipe OWNER TO postgres;

--
-- Name: cuisine_restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuisine_restaurant (
    cuisine_id integer,
    restaurant_id integer
);


ALTER TABLE public.cuisine_restaurant OWNER TO postgres;

--
-- Name: cuisines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuisines (
    id integer NOT NULL,
    name text,
    history text,
    customs text,
    photo text,
    dishes json,
    is_visible boolean DEFAULT true
);


ALTER TABLE public.cuisines OWNER TO postgres;

--
-- Name: cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuisines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuisines_id_seq OWNER TO postgres;

--
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuisines_id_seq OWNED BY public.cuisines.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    name text,
    steps text,
    photos json,
    is_visible boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name text,
    description text,
    photos json,
    rating numeric,
    price text,
    review_count integer,
    popularity integer,
    address text,
    city text,
    zip text,
    state text,
    country text,
    latitude text,
    longitude text,
    is_visible boolean DEFAULT true,
    transactions json,
    hours json,
    phone text,
    tags json,
    photo text,
    yelp_id text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    restaurant_id integer,
    user_id integer,
    rating numeric,
    comment text,
    photos text,
    is_visible boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name text,
    last_name text,
    email text,
    username text,
    profile_photo text,
    password_hash text,
    latitude text,
    longitude text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines ALTER COLUMN id SET DEFAULT nextval('public.cuisines_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (user_id, restaurant_id, created_at) FROM stdin;
\.


--
-- Data for Name: cuisine_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisine_recipe (cuisine_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: cuisine_restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisine_restaurant (cuisine_id, restaurant_id) FROM stdin;
\.


--
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisines (id, name, history, customs, photo, dishes, is_visible) FROM stdin;
1	Italian	Italian cuisine has its roots in ancient Roman and Etruscan civilizations. It was heavily influenced by Mediterranean and Arab cultures during the Middle Ages. However, the modern Italian cuisine that we know today took shape during the Renaissance period. Italian cuisine is known for its regional diversity, with each region having its own specialties. Pasta, pizza, risotto, and various types of sauces, such as Bolognese and Marinara, are iconic Italian dishes.	In Italian culture, food plays a central role in social gatherings and family life. Italians have a strong emphasis on traditional cooking methods and the use of fresh, high-quality ingredients. Sharing meals with loved ones is highly valued, and many Italian customs revolve around food. For example, the Sunday family lunch is a cherished tradition where multiple generations gather to enjoy a leisurely meal together. Additionally, Italians have specific customs related to coffee, such as standing at the bar to drink espresso rather than sitting at a table.	https://images.unsplash.com/photo-1616299915952-04c803388e5f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1524&q=80	["Pizza Margherita","Spaghetti Bolognese","Lasagna","Risotto","Caprese Salad","Tiramisu","Gelato","Cannoli","Panzanella","Osso Buco"]	t
2	Chinese	Chinese cuisine is one of the oldest and most diverse in the world, with a rich culinary history spanning over thousands of years. It has been shaped by factors such as geography, climate, and cultural influences. Different regions of China have their own distinct culinary traditions. Chinese cuisine emphasizes the balance of flavors, textures, and colors. Staple ingredients include rice, noodles, soy sauce, tofu, and a wide variety of vegetables. Popular dishes include Peking duck, Kung Pao chicken, and dim sum.	Chinese culinary customs are deeply rooted in social and cultural traditions. Meals in Chinese culture are often seen as an opportunity for family members to come together and share food. The concept of 'family-style' dining is prevalent, where dishes are placed in the center of the table for everyone to share. Additionally, there are etiquettes around the use of chopsticks, such as not sticking them vertically into the rice bowl, as it resembles funeral rituals. Chinese New Year is a significant celebration with its own set of culinary customs, including specific dishes that symbolize luck and prosperity.	https://images.unsplash.com/flagged/photo-1556742524-750f2ab99913?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80	["Kung Pao Chicken","Sweet and Sour Pork","Peking Duck","Dim Sum","Mapo Tofu","General Tso's Chicken","Chow Mein","Spring Rolls","Hot Pot","Fried Rice"]	t
3	Mexican	Mexican cuisine has a long history that dates back to ancient civilizations such as the Aztecs and Mayans. It combines indigenous ingredients and cooking techniques with Spanish influences brought by the conquistadors. Mexican cuisine is known for its vibrant flavors, diverse use of chilies, corn-based dishes like tortillas and tamales, as well as ingredients such as beans, avocados, tomatoes, and spices like cumin and cilantro. Tacos, enchiladas, guacamole, and mole are iconic Mexican dishes.	In Mexican culture, food customs are closely tied to celebrations, religious practices, and family gatherings. Mexican cuisine is often associated with festivals and special occasions. Traditional Mexican dishes, such as tamales and mole, are labor-intensive and involve the participation of multiple family members, fostering a sense of community and togetherness. Mexican customs also include the observance of Dia de los Muertos (Day of the Dead), where families honor deceased loved ones by preparing their favorite foods and setting up altars.	https://images.unsplash.com/photo-1582234372722-50d7ccc30ebd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80	["Tacos","Guacamole","Enchiladas","Chiles Rellenos","Pozole","Tamales","Quesadillas","Salsa and Chips","Mole","Churros"]	t
4	Korean	Korean cuisine has evolved over thousands of years and is deeply rooted in ancient traditions. It has been influenced by Chinese and Japanese culinary practices but has its own distinct identity. Korean cuisine often features fermented foods like kimchi and doenjang (soybean paste), as well as grilled meats like bulgogi (marinated beef) and galbi (short ribs). Rice, noodles, vegetables, and seafood are also prominent ingredients. Bibimbap, kimchi jjigae, and samgyeopsal are well-known Korean dishes.	Korean culinary customs are deeply ingrained in daily life and social interactions. The dining experience in Korea emphasizes communal eating and the sharing of multiple dishes. Respect for elders is a significant aspect of Korean culture, and this is reflected in dining customs. Younger individuals often wait for elders to begin eating before they start their meal. Korean cuisine is also known for its strong emphasis on health and balance, with a variety of banchan (side dishes) accompanying each meal, offering a wide range of flavors and textures.	https://images.unsplash.com/photo-1590301157890-4810ed352733?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80	["Bibimbap","Bulgogi","Kimchi","Japchae","Samgyeopsal","Galbi","Sundubu-jjigae","Kimbap","Dakgalbi","Mandu"]	t
5	Persian	Persian cuisine, also known as Iranian cuisine, has a rich culinary heritage that goes back over 2,500 years. It has been shaped by a variety of influences, including Central Asian, Mediterranean, and Arab cuisines. Persian cuisine features a wide array of herbs, spices, fruits, and nuts. Rice is a staple ingredient, often served with stews such as ghormeh sabzi (herb stew) and khoresh-e fesenjan (pomegranate and walnut stew). Grilled kebabs, saffron-infused dishes, and desserts like baklava and halva are also popular.	In Persian culture, food customs are intertwined with hospitality and social gatherings. Iranians take pride in offering generous hospitality to guests and consider it a reflection of their culture. Mealtimes are often communal, and multiple dishes are served to ensure guests have a variety of flavors to enjoy. Sharing meals with friends and family is a significant part of Persian customs. Additionally, certain dishes and ingredients hold symbolic significance, such as sabzi polo mahi (herbed rice with fish) served during the Persian New Year (Nowruz) to symbolize good luck and prosperity.	https://images.unsplash.com/photo-1654849759930-ad32c07b293c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=654&q=80	["Chelo Kebab","Ghormeh Sabzi","Fesenjan","Tahdig","Dolmeh","Ash Reshteh","Zereshk Polo","Baklava","Halva","Shirazi Salad"]	t
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, name, steps, photos, is_visible, created_at) FROM stdin;
1	Easy Tiramisu (Raw-Egg-Free) Recipe	This is by no means "authentic" tiramisu in that it has no raw eggs, but it's just as tasty!\n\n**Easy Tiramisu Recipe (no raw eggs!)**\n\n**Ingredients:** \n\n* About 1.5 packages worth of lady fingers (I got mine at an Italian market, ran out, and then had my husband run out to get more at Whole Foods - he got the store-brand, which is also imported from Italy). Make sure these are the HARD lady fingers, NOT the soft ones!\n* 2 C strong coffee/espresso\n* 9 Tbsp rum or marsala wine (you can half this for a less pronounced alcoholic flavor; I thought this was just right :)\n* 1 C heavy cream\n* 1-1.5 lb mascarpone\n* 2/3 C sugar, divided\n* 1 tsp vanilla extract\n* 2-3 Tbsp cocoa powder\n* Handful of chopped chocolate/chocolate shavings (optional)\n\n**Method:** \n\n1. **Prepare coffee/alcohol for dipping:** Combine coffee in a wide, shallow bowl, and combine with about 5 Tbsp of the rum. Set side.\n2. **Prepare mascarpone/cream mixture:** Whip heavy cream with 1/3 C sugar, 1 tsp vanilla extract, and 2 Tbsp rum, until you have soft peaks. Then, slowly fold in the mascarpone along with the other 1/3 C sugar and 2 Tbsp rum. Whip altogether until nice and fluffy. Set aside.\n3. **Prepare tiramisu layers:** Dip each side of a lady finger into the coffee/rum mixture for no more than 1-2 seconds per side (DO NOT DIP TOO LONG; This is the biggest mistake in making tiramisu. NO SOGGINESS!). Then, carefully lay in a pan (8x5 in), making sure all the ladyfingers are lined up side by side; trim if needed to fix snuggly into pan. Then, add a generous, even layer of the mascarpone/cream mixture on top of the ladyfingers, smoothing them out on the edges with a spatula. Dust with some cocoa powder with a colander/sieve. Repeat the ladyfinger layer with the final mascarpone layer, and dust the top with cocoa powder and chocolate shavings if using.\n4. **Refrigerate tiramisu** for at least 6 hours to allow it to set, and allowing the lady fingers to soften well. Cut with a clean knife, wiping off between slices for the cleanest edges, and enjoy!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
2	Classic Creme Brulee at home with only 4 ingredients! Why isn't everyone making this?	 \n\nOne of my favorite at home dessert recipes! Enjoy. You can also watch my fun step-by-step video here [https://youtu.be/9pB0X-ibfqM](https://youtu.be/9pB0X-ibfqM) if your into that sort of thing.\n\n**Creme Brulee**\n\nServes 2-4\n\nIngredients:\n\n3 egg yolks\n\n1 Cup heavy cream\n\n2 Tablespoons sugar + 1 teaspoon for bruleeing\n\n1/2 teaspoon vanilla\n\n**How To:**\n\n* In a heatproof bowl combine egg yolks and sugar, whisk vigorously for 2-5 minutes until color turns a pale yellow.\n* add vanilla\n* In a small saucepot heat the cream until it just comes to a boil and remove from heat.\n* Slowly a few tablespoons at a time, whisk hot cream into egg yolk mixture to *temper* the eggs.\n* Once all the cream in incorporated place heatproof bowl on top of a double boiler (small pan with about an inch of water brought to a boil) \\*Make sure the water doesnt touch the bottom of the bowl or it will get too hot.\n* Stir with a spatula for 5 minutes or until the mixture thickens to coat the back of a spoon.\n* remove from heat and add to your ramekins.\n* Place ramekins in a high sided brownie pan or casserole dish and place in the middle of a 325 degree oven.\n* Pour hot water into the brownie pan, making sure not to get any in the ramekins. Water should come half way up the sides of the ramekins.\n* Bake for 30 minutes or until set, but still a little wobbly.\n* Let cool for 2 hours minimum.\n* Sugar the top and dump off any excess, torch until crispy and golden amber, or place under the broiler set to high.\n* Enjoy!\n\n\\*The sugar for bruleeing works better if it is *sugar in the raw,* granulated sugar burns too fast and wont form a good crust.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
3	Vanilla-shallot butter poached monkfish	Purchased monkfish for a hotpot, but my fishmonger recommended I try out this instead! Monkfish has a meaty texture and tastes similar to lobster. The vanilla really enhanced the flavors; the poaching liquid was based on a [Langouste à la Vanille recipe](https://www.saveur.com/lobster-vanilla-sauce-recipe/)\n\n**Ingredients**\n\n- monkfish filet, membrane removed (3/4lb)\n- unsalted butter, cut into Tbsp slices (2 sticks)\n- shallot, roughly minced (1)\n- white wine (1/4-1/2 cup)\n- vanilla extract (2 tsp)\n\n**Directions**\n\n1. Prepare all your ingredients, remove the membrane on the monkfish if still attached (not necessary but I find it can be tough cooked)\n\n2. Heat 1-2 Tbsp water in a nonstick skillet on medium heat until sizzling\n\n3. Add butter to the hot skillet several Tbsp at a time, when melted add in shallot, white wine, and vanilla, bring to a low simmer\n\n4. Add monkfish filet to your poaching liquid\n\n5. Spooning liquid over the filet, poach for 3-5 minutes per side, flipping once (depends on your thickness). Alternately if you have a thermometer, cook to 140-150\n\n6. Serve &amp; spoon excess poaching liquid over fish &amp; whatever sides you prefer	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
4	Italian Meatballs	 Ingredients: \n\n1. Ground beef (1.8 lb / 800 g) \n\n2. Cottage cheese (0.4 lb / 200 g) \n\n3. Italian bread crumbs (1/2 cup) \n\n4. Parsley \n\n5. Lemon zest (from one lemon) \n\n6. Cheese (0.05 lb / 25 g) \n\n7. Egg (1 piece) \n\n8. Onion (1 medium onion) \n\n9. Garlic (2 cloves) \n\n10. Basil (1 tsp) \n\n11. Canned tomatoes (1 can) \n\n12. Balsamic vinegar (2 tbsp) \n\n13. Broth (4 oz / 120 g) \n\n14. Salt \n\nCooking method (video recipe is [here](https://www.youtube.com/watch?v=IaZ9El4XdQg)): \n\n1.Miix the ground beef, cottage cheese, bread crumbs, salt, parsley, lemon zest, cheese, egg and knead \n\n2. Fry the onion, garlic and basil for 3 minutes \n\n3. Combine the mixture with minced meat and knead \n\n4. Form meatballs \n\n5. Fry for 3 minutes on each side \n\n6. Mix canned tomatoes, broth and balsamic vinegar and after boiling put meatballs \n\n7. Close and fry for 15 minutes \n\n8. Delicious italian meatballs are ready!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
5	Red Lentils and Spinach Lasagna, what do you think?	\\*\\*Spinach Lasagna\\*\\*:  \n\n\\*\\*Ingredients\\*\\*:  \n\n \\* 1 Pack (Instant) Lasagna Pasta\n\n \\* 1 Pack Frozen Spinach\n\n \\* (optional) red lentils\n\n \\* 200ml Soy cream\n\n \\* Tomato Sauce  \n\n \\* 150g Shredded Mozzarella Cheese\n\n \\* 1/2 Onion \n\n \\* Chopped Garlic Clove\n\nCooking Instructions:\n\n1. **Start with the sauce**: in this recipe I like to use a combination of red lentils and tomato sauce\n2. **Make the white cream**: in a pan fry the chopped onion and garlic, in a bit of Olive oil for about 2 minutes. Then pour the soy cream and let it steer for around 8-10minutes. \n3. **Grab the lasagna pasta**: follow the instruction on the pasta box for having it ready. \n4. **Layer it u**p: Start with a little sauce in the bottom of the pan to ensure your noodles dont stick to the bottom, then top with noodles, cream, and sauce and then repeat. Dump allllll of that extra mozzarella on the top for good measure!\n5. **Cover and bak**e: Covering the lasagna with foil to bake ensures that the moisture stays inside and cooks the noodles. We will uncover once we add the cheese and let it sit at room temperature for some time before slicing to help it set well.\n\nEnjoy!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
37	Shrimp Piccata with homemade pasta!	If you like you can also watch the step-by-step video here [https://youtu.be/wY8GwVvp3Nk](https://youtu.be/wY8GwVvp3Nk)\n\n&amp;#x200B;\n\nPasta:\n\n&amp;#x200B;\n\n2C AP flour\n\n3 eggs\n\n1/2 onion \n\n Saute garlic and oil for 1 minute until fragrant and add the shrimp. Cook for 2-3 more minutes.\n\n Remove from pan and set aside. \n\nAdd butter and onion and saute until translucent.\n\n Add half and half, and kale. Reduce heat to med-low and simmer 3 minutes. Add parmesan, lemon, capers, and adjust salt and pepper.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
6	Soft and Chewy Snickerdoodle Cookie Bars	 **Ingredients** \n\n* Nonstick cooking spray \n* 2 sticks (1 cup) unsalted butter, at room temperature \n* 1 cup granulated sugar \n* 3/4 cup packed light brown sugar \n* 2 large eggs \n* 1 1/2 teaspoons vanilla extract \n* 2 1/2 cups all-purpose flour \n* 1 teaspoon baking powder \n* 3/4 teaspoon salt \n\n**Cinnamon Mixture**\n\n* 1/4 cup granulated sugar \n* 3 teaspoons ground cinnamon\n\n**Glaze**\n\n* 1 cup powdered sugar\n* 2 tablespoons milk\n* 1/4 teaspoon vanilla\n\n**Steps**\n\n1. Heat oven to 350° F. Spray bottom of a 13x9-inch baking pan with cooking spray. In bowl, combine flour, baking powder, and salt, set aside.\n2. In large bowl, beat butter with both sugars until creamy. Gradually beat in eggs and vanilla into sugar mixture until combined. On low speed, slowly mix in dry ingredients until combined.\n3. Spoon half the batter into pan and spread evenly. Sprinkle cinnamon-sugar mixture evenly over batter.\n4. Dollop teaspoon size amounts of remaining batter evenly over cinnamon-sugar mixture.\n5. Bake 25 minutes or until golden brown. Cool completely. \n6. In small bowl, stir glaze ingredients until smooth and thin. Drizzle over bars. Cut bars into 6x4 rows.\n\nIf you'd like to watch me make these bars, you can watch it [here](https://youtu.be/KIVhPdvEgk8)!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
7	Thai Holy Basil Chicken Stir-Fry with a Crispy Fried Egg (Pad Krapow)	\nCook Time: 10 mins\n\nServings: 1\n\n###### EQUIPMENT\n\n- Wok or Large Frying Pan\n\n###### INGREDIENTS\n\n" 150g chicken thigh, cut into chunks\n\n" 2 tbs veg oil \n\n\n###### INSTRUCTIONS \n\n- Marinate the chicken in oyster sauce for at least 30 mins - this will help tenderise the meat.\n- Pound chillies and garlic into a coarse paste using a mortar and pestle. If you dont have a mortar and pestle, finely chopping each is fine. \n- In a hot wok or large frying pan, add veg oil and then chicken, stir fry over high heat for about 4 minutes until chicken is about 80% cooked through.\n- Add chillies and garlic, stir fry for 1 min \n\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
8	Almond Sandies	Ingredients\n\n* 1 cup (240ml) all-purpose flour\n* 1 cup (240ml) sliced almonds\n* 1 stick (120ml) room temperature butter\n* 1/2 cup (120ml) brown sugar\n* 1 1/2 teaspoon (7.5ml) almond extract\n* 1/4 teaspoon (1ml) salt\n\nDirections\n\n1. Preheat oven to 350°F (175°C).\n2. Combine all ingredients together in a mixing bowl.\n3. Mix with a hand mixer until a solid dough forms and the almonds are broken up.\n4. Roll into approximately 9 equal sized balls (smaller if you want smaller cookies) and place on a baking sheet lined with parchment paper.\n5. Flatten all the balls slightly until they're roughly 1cm thick.\n6. Bake for 15 minutes.\n7. Allow to cool and dust with powdered sugar or serve as is.\n\nSource: [here's a link to the blog post](https://justthedarnrecipe.com/almond-sandies) if you're interested in that.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
9	Folded Sushi - Alaska Roll	Craving for some sushi but don't have a sushi roller? Try this easy version instead. It's super easy yet equally delicious!\n\n[Video Recipe](https://www.youtube.com/watch?v=1LJPS1lOHSM)\n\n# Ingredients\n\nServing Size:  \\~5 sandwiches      \n\n* 1 cup of sushi rice\n* 3/4 cups + 2 1/2 tbsp of water\n* A small piece of konbu (kelp)\n* 2 tbsp of rice vinegar\n* 1 tbsp of sugar\n* 1 tsp of salt\n* 2 avocado\n* 6 imitation crab sticks\n* 2 tbsp of Japanese mayo\n* 1/2 lb of salmon  \n\n# Recipe     \n\n* Place 1 cup of sushi rice into a mixing bowl and wash the rice at least 2 times or until the water becomes clear. Then transfer the rice into the rice cooker and add a small piece of kelp along with 3/4 cups plus 2 1/2 tbsp of water. Cook according to your rice cookers instruction.\n* Combine 2 tbsp rice vinegar, 1 tbsp sugar, and 1 tsp salt in a medium bowl. Mix until everything is well combined.\n* After the rice is cooked, remove the kelp and immediately scoop all the rice into the medium bowl with the vinegar and mix it well using the rice spatula. Make sure to use the cut motion to mix the rice to avoid mashing them. After thats done, cover it with a kitchen towel and let it cool down to room temperature.\n* Cut the top of 1 avocado, then slice into the center of the avocado and rotate it along your knife. Then take each half of the avocado and twist. Afterward, take the side with the pit and carefully chop into the pit and twist to remove it. Then, using your hand, remove the peel. Repeat these steps with the other avocado. Dont forget to clean up your work station to give yourself more space. Then, place each half of the avocado facing down and thinly slice them. Once theyre sliced, slowly spread them out. Once thats done, set it aside.\n* Remove the wrapper from each crab stick. Then, using your hand, peel the crab sticks vertically to get strings of crab sticks. Once all the crab sticks are peeled, rotate them sideways and chop them into small pieces, then place them in a bowl along with 2 tbsp of Japanese mayo and mix until everything is well mixed.\n* Place a sharp knife at an angle and thinly slice against the grain. The thickness of the cut depends on your preference. Just make sure that all the pieces are similar in thickness.\n* Grab a piece of seaweed wrap. Using a kitchen scissor, start cutting at the halfway point of seaweed wrap and cut until youre a little bit past the center of the piece. Rotate the piece vertically and start building. Dip your hand in some water to help with the sushi rice. Take a handful of sushi rice and spread it around the upper left hand quadrant of the seaweed wrap. Then carefully place a couple slices of salmon on the top right quadrant. Then place a couple slices of avocado on the bottom right quadrant. And finish it off with a couple of tsp of crab salad on the bottom left quadrant. Then, fold the top right quadrant into the bottom right quadrant, then continue by folding it into the bottom left quadrant. Well finish off the folding by folding the top left quadrant onto the rest of the sandwich. Afterward, place a piece of plastic wrap on top, cut it half, add a couple pieces of ginger and wasabi, and there you have it.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
10	Cabbage soup	Ingredients:\n\n1. Onion (1/2 onion)\n2. Garlic (2 cloves)\n3. Grated ginger (1 tsp)\n4. Celery (3 stalks)\n5. Cabbage (1/2 kacana)\n6. Chicken broth (5 cups)\n7. Frozen spinach (0.6lb / 300g), can be replaced with fresh\n8. Parsley (1/2 cup)\n9. Paprika (1/2 tsp)\n10. Boiled chicken (1 cup), optional\n11. Olive oil\n12. Salt\n\nCooking method:\n\n1. Fry onion, garlic, ginger in olive oil until the onion is soft (2-3 minutes)\n2. Add celery, fry for 1 minute, add salt and cabbage, fry for another 2 minutes\n3. Add broth, spinach and cook for one minute after boiling\n4. Add parsley, paprika and chicken (optional) and cook for another 1 minute\n\nYou can see how I made this soup [here](https://www.youtube.com/watch?v=klvuqjAWvXg)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
11	Fried Banana Balls (Kuih Kodok)	The original recipe with more images and instructions video can be found [here](https://www.mylovelyrecipes.com/recipes/asian-cuisine/kuih-kodok/)\n\n&amp;nbsp;\n\n#####Preparation time: 15 minutes\n#####Cooking time: 5 minutes\n#####Serving size: about 8 pieces\n\n&amp;nbsp;\n\n#INGREDIENTS\n- 200g Peeled Banana\n- 50g All-purpose Flour\n- 1 tbsp Sugar\n- 0.25 tsp Salt\n- 0.25 tsp Baking Soda\n\n&amp;nbsp;\n\n#INSTRUCTIONS\n1. Add salt, baking soda, and sugar after mashing the banana.\n2. Add the sifted flour and mix well.\n3. Rest the batter for about 10 minutes.\n4. Pour oil into the pot, scoop into the banana batter after the oil temperature is hot, and fry it until light brown color.\n5. Let cool and enjoy.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
12	Potato and Leek Soup	**Potato and Leek Soup**\n\nFor full recipe, substitutions, variations, tips, &amp; tricks, visit: [https://maplewoodroad.com/food/potato-and-leek-soup/](https://maplewoodroad.com/food/potato-and-leek-soup/)\n\n### INGREDIENTS \n\n* 4 Tbsp butter\n* 4 leeks, trimmed and chopped to 1/8"\n* 2 cloves garlic, thinly sliced\n* 1/2 tsp kosher salt\n* 1/2 tsp freshly cracked black pepper\n* 2-1/2 c chicken stock\n* 2-1/2 c water\n* 2 bay leaves\n* 1 Tbsp chopped flat-leaf Italian parsley (plus more for garnish)\n* 1 tsp fresh thyme leaves\n* 1 lb Yukon potatoes, thinly sliced\n* 1/4 c heavy cream\n* Salt and pepper to taste\n\n### INSTRUCTIONS \n\n* In a large pan, heat 4 Tbsp butter until it bubbles. \n* Then add the chopped leeks. Season with 1/2 tsp kosher salt and 1/2 tsp pepper. Stir occasionally for about 10 minutes until the leeks get really soft and the edges begin to brown. \n* Add garlic and stir for another couple of minutes. Taste before the next step. \n* Add 5 c liquid (I use 50% chicken stock and 50% water) and the herbs. Taste and see if you like the balance so far. Some stocks are saltier than others. \n* Crank up the heat to bring it to a quick boil, then reduce the heat and simmer for 5 minutes.\n* Add 1 lb of thinly sliced Yukon gold potatoes and let it simmer with the lid on for about 40 minutes. Stir occasionally.\n* The soup is done when the potatoes are very tender and starting to fall apart. We might still have to add some more salt and pepper. Potatoes soak up some salt. Taste again. Season with salt until you achieve the desired yumminess. If you like, add a pinch of cayenne pepper, which really makes it pop. \n* Serve in a bowl, add a splash of heavy cream (if desired), and top with some fresh flat-leaf Italian parsley.\n* If you prefer a creamy consistency, use an immersion blender and blend everything together before serving. 	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
13	Creamy Tadka Dal... the trick is in making a deep toasted Tadka as your topping.	[Step-by-Step Pics with Video](https://www.finedininglovers.com/recipes/ultimate-tadka-dal-recipe-step-step)\n\n**INGREDIENTS:**\n\n**Lentils**\n\n1 cup (240g), split moong yellow\n\n**Spring Water**\n\n4 cups (880ml)\n\n**Salt**\n\n1 1D2 tsp plus a pinch\n\n**Turmeric**\n\n1D4 tsp\n\n**Step 7**\n\nThen drizzle on the remaining tadka as a garnish (without mixing). Finish with garam masala and fresh coriander leaves.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
14	VIRAL TIK TOK PASTA ! ( Baked feta, tomato pasta ) quite simple and healthy	 INGREDIENTS\n\nFusilli \n\n1 ½ cups Cherry tomatoes \n\n400g feta cheese\n\nSalt and pepper \n\nDried Oregano \n\nDried basil\n\n2 cloves garlic \n\nSTEPS [here](https://www.youtube.com/watch?v=h1lPvkUaxPE) \n\nEverybody welcome back to another video today we're going to do feta tomato pasta \n\n1. let's start off by washing cherry tomatoes \n2. after washing we could transfer them to oven safe dish and make a hole in the middle of tomatoes\n3. add your feta cheese inside \n4. Drizzle olive oil \n5. then add 2 pinches of salt and black pepper \n6. add dried basil and dried oregano and a few shakes of chili flakes\n7. some more olive oil cause why not \n8. Chop 2 cloves of garlic and add on top then it's ready for the oven. \n9. Baked at 425 degrees for 35 minutes \n10. after 35 minutes your tomatoes should be nice and chard \n11. smash everything together and give them a good mix \n12. Add pasta of choice \n13. and toss them around one more time just like it did with the sauce \n14. there you have it you got yourself a creamy tomato pasta for dinner	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
15	Italian Classic Valdostana, a Delicious Second Course From North Italy	 Valdostana is one of the typical dishes of the Valle D'Aosta tradition, known all over the world and appreciated especially in the autumn and winter period for the ingredients with which it is prepared that remind us of this time of year. As always if you like the recipe and want to subscribe you are welcome\n\nVideo Recipe [Here](https://youtu.be/TqPZL0ZOTGU)\n\nINGREDIENTS FOR 2 VALDOSTANE\n\n* 2 slice of beef sirloin 100 gr Fontina cheese ( cheddar or mozzarella if you can't find it)\n* 100 gr Sliced ham ( or smoked ham )\n* 2 eggs\n* Flour\n* Breadcrumbs\n* Salt\n* Butter\n\nINSTRUCTION\n\n* Cut 100 gr of Fontina cheese in slice, if you can't find it you can use cheddar or even mozzarella.\n* Take a sirloin slice and beat it with a meat tenderizer. For best results and to not ruin the fibers of the meat, cover it with plastic wrap first.\n* Place a couple of slice of ham ( or smoked ham ) on the slices of sirloin then cover them with the cheese of your choice\n* Fold the meat and cover the stuffing, taking care that the edges remain free.\n* Seal the wallets you just made by pressing along the edges firmly.\n* Now take the Valdostana and flour it well, then dip it in beaten eggs with a pinch of salt and finally in breadcrumbs.\n* Melt the butter in a frying pan. When it is hot and begins to bubble,begin to cook valdostana, browning both sides for about 4-5 minutes, until golden brown.\n* Wipe off the excess of butter with paper towels and serve while are still hot\n\nThat's all! if you have any question feel free to ask \\^\\_\\^	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
16	Blueberry danishes	Ingredients: \n\n1. Cottage cheese (0.2 lb / 100 g) \n\n2. Yolks (2 pcs) \n\n3. Grated lemon (1 tbsp) \n\n4. Sugar powder (6 tsp) \n\n5. Puff pastry (1 lb / 450 g) \n\n6. Blueberries (or any berries) \n\n7. Strawberry jam (or whatever) \n\n8. Milk (1 tbsp) \n\nCooking method: \n\n1. Make the filling (mix cottage cheese, yolk, grated lemon and powdered sugar)\n2. Roll out puff pastry, cut out squares and form danishes \n3. Put the filling and grease the dough with mixed yolk and milk \n4. Put blueberries (or other berries) \n5. Bake for 7-10 minutes at 400° F/ 200° C degrees \n6. Grease with strawberry jam (or other jam) \n7. Sprinkle with powdered sugar \n8. Awesome dessert is ready!\n\nYou can watch how I cook it [here](https://www.youtube.com/watch?v=EHdvrya99_4&amp;t=13s).	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
17	White Chicken Chili	**Recipe: White Chicken Chili**\n\n**Ingredients**\n\n* 1 yellow or white onion\n* 4 cloves garlic\n* 2 jalapeños\n* 1 lb to 1.5 lbs chicken thighs or breasts\n* 1 16oz. jar salsa verde or homemade (instructions incl)\n   * Salsa: 3 jalapeños, 2 anaheims, 1 poblano (all peppers seeded to desired amout), 4 tomatillos, 3 garlic cloves, white onion, handful cilantro, salt, cumin, lime juice\n* 2 15oz. cans cannellini beans\n* 1 15oz. can pinto beans\n* 1 Tbsp ground cumin\n* 1 tsp dried oregano\n* ¼ tsp cayenne pepper\n* ¼ tsp freshly ground black pepper\n* 1/2 tsp salt\n* 2 cups chicken broth or stock, or 2 cups water plus 2 tsp better than bullion\n* 4 oz. Monterey Jack cheese, shredded\n\n&amp;#x200B;\n\n**Instructions**\n\n1. Make Salsa: Cut peppers length wise and remove seeds with a spoon or knife. Char 3 jalapeños, 2 anaheims, 1 poblano, 1 tomatillo and one garlic clove in the husk on a cast iron or under the broiler and then peel off pepper skin after it sits under a towel or plate for like 15 minutes. Boil other three tomatillos until color change.\n2. Add roasted/cooked salsa ingredients to blender with some cilantro, 2 fresh cloves of garlic, quartered white onion, and juice of one lime, salt, and some cumin\n3. Dice the onion and mince the garlic. Slice the jalapeño lengthwise, scrape out the seeds with a spoon, then dice.\n4. Cook chicken (seasoned with salt, garlic, onion powder, smoked paprika), if using stock to cook shredded chicken (sear on one side then a lil on the other and cover with inch of stock), reserve stock for soup.\n5. Sweat onions and jalapenos in some of the chicken fat from the stock or some olive oil,  then add garlic, the cumin, oregano, cayenne, and pepper and cook for 30 seconds. Pour the salsa over top. Cook for a lil\n6. Add the beans, stir, add the chicken and stir, then add the stock.  Stir the chili, slightly mashing the beans with the back of the spoon as you stir. The mashed beans will help thicken the chili.\n7. Bring to a boil, then turn lower to simmer for 30 to 45 minutes\n8. Serve the chili topped with shredded Monterey Jack cheese. Other optional toppings include fresh cilantro, diced avocado, freshly squeeze lime, sliced jalapeños, or tortilla chips.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
18	Copycat Trader Joe's discontinued Mushroom Turnovers	This is a copycat of Trader Joe's discontinued Mushroom Turnovers, made from ingredients listed on the box.\n\n[**Step-by-step Video**](https://youtu.be/NHyFv6dlSmw) for following along\n\n**Ingredients**:\n\n*for the crust*:\n\n* 1 cup flour\n* 4 tbsp butter (half stick)\n* 4 tbsp cream cheese\n* 1/2 tsp salt\n* 2 tbsp cold water\n\n*for the filling*:\n\n* 1 shallot, chopped\n* 1/2 lb mushrooms, diced\n* 1/2 tsp dry minced onion\n* 1/2 tsp Trader Joe's mushroom seasoning (optional)\n* 1/2 tsp salt\n* 1/4 tsp pepper\n* 1/4 cup sour cream\n\n**Instruction**:\n\n1. Stir fry chopped shallots in olive oil until fragrant\n2. Add ground pepper and mushrooms; cook until mushroom is softened, and water from the mushroom seeps out\n3. Add dry onion flakes, mushroom seasoning, &amp; salt; cook until excess water is evaporated \n4. Turn off the heat, stir in the sour cream; mix until well combined; set aside\n5. Make the pastry: whisk flour with salt\n6. Cut butter &amp; cream cheese into small cubes, work them into the flour until you have a crumbly meal\n7. Add water and form a dough. Cut dough into 8\\~12 portions\n8. Roll out each portion, fill with mushroom filling, fold and pinch to seal\n9. Trim off excess dough; egg wash if desired\n10. Airfry for \\~8 minutes at 400F, until pastry is cooled through. Enjoy! 	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
92	Lemon Mug Cake!	Ingredients:   \n31 grams of all purpose flour   \n25 grams of granulated sugar   \n3 grams of baking powder   \npinch of salt   \n6 gram of lemon zest   \n30 grams of melted butter   \n4 milliliters of vanilla extract   \nHalf lemon juice   \nEgg\n\nInstructions:   \n1. Get a mug and add 25 grams of granulated sugar, 3 grams of baking powder, pinch of salt, 31 grams of all purpose flour, 6 grams of lemon zest, 4 milliliters of vanilla extract, 1 egg, half a lemon juice and 30 grams of melted butter. Mix everything   \n2. Microwave for 1 minute (1000W).   \n3. Finally, add lemon zest on top. Enjoy!   \n4. Video instructions on Youtube Lemon Mug Cake	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
19	Crunchy Twisted Donuts (Ma Hua) Recipe	**Ingredients:**\n\n\\- 300g all-purpose flour\n\n\\- 50g sugar\n\n\\- 2g salt\n\n\\- 2g baking soda\n\n\\- 2 tbsps (30ml) oil\n\n\\- 3oz (90ml) lukewarm water\n\n&amp;#x200B;\n\n[A full video with detailed instructions can be found here.](https://youtu.be/dbKRHx6nDS8)\n\n&amp;#x200B;\n\n**Directions:**\n\n1. Mix the flour, salt, sugar, and baking soda together. Add lukewarm water and mix with the dry ingredients. Add one egg and mix everything. Cover the dough and let it rest for 30 min.\n2. After resting, the dough will be very easy to knead. Knead the dough until smooth.\n3. Divide the dough into half and make the first 6 twisted donuts. Flatten the dough with the rolling pin and roll it out into a rectangular shape. Divide the dough into 12 pieces evenly.\n4. Take one piece out and roll it out into a 20-inch long strand. Repeat and make a second strand.\n5. Put two strands together and start twisting them by pushing one hand up and the other hand down. Keep twisting until you feel strong resistance from the dough.\n6. Lift up both ends. The dough should twist together by itself. Pinch the ends together. Cover it with a cloth or plastic wrapper to prevent the dough from drying out.\n7. Heat up the oil to 250^(o)F or 120^(o)C. Add the twisted donuts. Use low to medium heat and fry them for about 18 min until golden. Flip it a few times during frying.\n8. When the frying is done, place the cooked twisted donuts on paper towels to soak up the excess oil. Leave them at room temperature to cool down.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
20	How to Make Pizza in a Hurry	A quick meal in 10 minutes, quick and tasty for everyone. How to make pizza in a hurry. Make hot pizza-like sandwiches for breakfast or lunch.  \n\n**INGREDIENTS:**  \n* White or Grey bread - 7 slices  \n* Tomato - 1 pc.  \n* Paprika - 1 pc.  \n* Sausage or ham - 80-100 gr.  \n* Herbs (I used basil and onions).  \n* Hard cheese - 80-100 gr.  \n* Mayonnaise - 2 tbsp. Spoon.  \n* Bake for 10-15 minutes at 180°C /360°F  \n&gt; Enjoy))\n  \n**DIRECTIONS:**  \nAll you have to do is cut everything into small cubes, mix, spread on bread, bake in the oven and you're done, it couldn't be easier. And the taste is just amazing. This is a really tasty pizza sandwich recipe that takes about 10 minutes to make. The result is a juicy filling on a crispy loaf.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
21	3-Ingredient Matcha Ice Cream (No Churn)	Sharing my Matcha ice cream recipe that requires only 3 ingredients, without an ice cream maker!\n\nAll you need for this recipe is matcha powder, whipping cream, and condensed milk, and you can make a homemade batch of matcha ice cream that's super creamy and full of matcha flavor, all without the trip to Japan.\n\nYou can use either a hand blender or a stand mixer for this recipe. Feel free to mix with your hands as well if you don't mind a serious arm workout :3. Enjoy everyone! x\n\n**\\[RECIPE (ONE LARGE PINT - 16 SERVINGS)\\]**\n\n**Ingredients:**\n\n* 1 (14-ounce) can sweetened condensed milk\n* 2 tbsp matcha powder, add more if desired\n* 2 cups heavy whipping cream, cold\n\n**Directions:**\n\n1. Add sweetened condensed milk into a bowl. Sift in the matcha powder and mix until well combined. Set aside.\n2. Add heavy cream to a mixing bowl, or into a bowl of a stand mixer. Start whipping on low speed, gradually increase the speed, and continue to whip until stiff peaks form. Fold in the matcha paste, and whip again on medium speed until well combined.\n3. Transfer to an airtight container (or a loaf pan sealed tightly with plastic wrap) and freeze for at least 6 hours before serving. Enjoy with your favorite toppings!\n\n**Notes:**\n\nChopped pistachios pair wonderfully with matcha ice cream. Other great toppings include white chocolate, fruits, or other chopped nuts.\n\nStored in an airtight container, matcha ice cream will last up to 6 weeks in the freezer. Thaw for about 10 minutes prior to serving for easy scooping!\n\n**<C**Original recipe with quick video tutorial can be found [here](https://www.cookerru.com/matcha-ice-cream/).	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
22	Gnocchi with creamy sauce	Here in Argentina we love pasta. I must have made gnocchi at least 20 times the past year (and i have a dough ready right now). My recipe is a little different but to each their own. Here's some tips I've learned:\n\n\\- cook potatoes in the oven, dont boil them. If you do they'll absorb too much water and the dough will be impossible to handle.\n\n\\- try replacing them with sweet potatoes, beets or pumpkin. One of my fav. is sweet potato gnocchi with a pinch of turmeric to enhance the color and a barely-cooked cherry tomatoes-garlic-olive oil sauce.\n\n\\- use a little more flour so they cook more "al dente" and not too soft. you should be able to feel the gnocchi with each bite. at least i prefer them that way. i hate it when they're too soft and sticky\n\n\\- leave the dough half an hour in the fridge so the moisture spreads evenly and the cold makes it harder. that way it'll be easier to manipulate\n\n\\- here, at least, everyone (and i mean everyone) knows this rule for gnocchi, ravioli and other similar pasta: throw the pasta in. once it boils, it'll be around a minute until they surface. once they do, they are ready. to my taste, if i waited another minute or two after they did, they'd be overcooked..... however, this probably has something to do with the fact that we make them a lot smaller than you did.\n\n\\- giving them the proper shape is important because it makes them hold the sauce. they should be like... folded on top of themselves with fork markings on the outside. its really easy to do. if you have a wooden mold (we usually do) its even easier and they'll look better. [Something like this.](https://lasrecetasdelchef.net/wp-content/uploads/2018/12/%C3%B1oquis-de-papa.jpg)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
23	How to make Chocoflan | Impossible cake	 \n\nVideo recipe [How to make chocoflan | Impossible cake](https://youtu.be/oOufQorGRIo)\n\n**Ingredients**\n\nFor the caramel:\n\n* 160 g sugar (3/4 cup)\n\nFor the flan:\n\n* 4 eggs\n* 350 ml of milk (1 3/4 cups) -\n* 120 g of cream cheese\n* 390 g of condensed milk (1 and 1/4 cup) (recipe in video description)\n* vanilla\n\nFor the cake:\n\n* 1 egg\n* 180 g of sugar (1 and 5/8)\n* 180 ml of oil (3/4 cup)\n* 300 ml of milk (1 and 1/4 cup)\n* 270 g flour (1 and 2/3 cup)\n* 2 teaspoons of baking powder\n* 35 g of pure cocoa (1/3 cup)\n\n**Instructions**\n\n* In a saucepan pour 160 g of sugar, put the fire at temperature medium and let it melt slowly without stirring\n* When creating a caramel layer on the bottom, mix to speed up caramelization\n* Mix until the sugar is completely dissolved over low heat Important: be careful not to burn, as it would be bitter\n* Immediately pour the caramel into the mold\n* Whisk 350 ml of milk, 4 eggs, 120 g of cream cheese, 390 g of condensed milk and vanilla.\n* Pour the mixture into a mold and cover\n* Pour very hot water into an oven safe tray and bake for 50 -60 minutes at 180 ° C\n* In a bowl, put 180 g of sugar, 1 egg, 180 ml of oil, 300 ml of milk and mix\n* Add 270 g of flour, 35 g of pure cocoa, 2 teaspoons of chemical yeast and mix until you get a dough creamy and homogeneous\n* Prick the flan with a toothpick or knife, if it comes out clean, it will be at your point\n* Pour the mixture into the mold\n* Bake for 25-40 minutes at 180 ° C\n* OPTIONAL: You can moisten the cake (with milk mixed with a little sugar) for a juicier result	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
24	Old Fashioned Pancake Recipe	The simplest recipes are some of the hardest to perfect! A few tips based on your comment:\n- Use fresh ingredients. If your baking powder and flour are old and expired youll have subpar results. \n- Let the batter rest a bit, not too long. 15-30 minutes at most. \n- Pans make a big difference. I like cast iron for heat retention. I would not use a Dutch oven or anything with tall sides for a pancake. With cast iron, never raise the heat over low-med for most cooking. With pancakes, closer to low. The pan retains heat really well and you want the pancake to have time to fully cook while getting a light golden brown versus dark and burnt. Slower is better. \n- Use a proper size laddle. One scoop into the pan. With this recipe it will be pretty bubbly so laddle one scoop into the pan and spread it a bit if you need to. Let it sit. Watch the steam rise off of it and the bubbles emerge from the batter as it cooks. Those butter chards are melting and leaving cavities as well. Once the bubbles have emerged across the pancake and the steam is slowing down its time to flip. If the pan temp is right it should be a golden brown. About a third of the time on flip side and its done. \n- if you want pancakes like the ones in the picture, dont be afraid to throw more oil in the pan. A tablespoon or two each time you laddle in new pancakes. \n\nGood luck!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
25	Chinese Eggplant with Garlic Sauce	So we really like this dish at restaurants, but it's super oily (you pretty much fry the eggplants before pouring over the sauce), so I tested this a couple times at home to make it without all the oil and in an IP so it's a tad faster. Recipe below:\n\n### Equipment\n\n* Pressure cooker\n\n### Ingredients\n\n* 2 long Chinese eggplants\n* Coarse salt\n* ½ lb (220 grams) ground meat (beef, turkey or pork)\n* 2 scallions chopped\n* 2 slices ginger\n* 3 cloves garlic minced\n* 2 Thai chillis chopped\n* 1 tbsp doubanjiang (broad bean sauce)\n* ½ tbsp dark soy sauce\n* 1 tbsp light soy sauce\n* 1 tbsp dark vinegar\n* 1 tbsp sesame oil\n* 1 tbsp granulated sugar\n* 1 tbsp cornstarch\n* 1 cup water\n* 1 tbsp vegetable oil\n\n### Instructions\n\n* Slice eggplant into 4 inch/10 cm stalks. Sprinkle with coarse salt and let it sit for 30 minutes. You'll see the eggplant "sweat." Pat dry.\n* Chop and dice your garlic, scallions, ginger, and Thai chillis. Set aside.\n* Make your sauce by mixing the dark and light soy sauces, vinegar, sesame oil, sugar, cornstarch, and water. Mix well.\n* Set Instant Pot to Saute. Heat up 1 tbsp of oil. If you are making protein, cook the meat until brown. Add in the garlic, scallions, ginger, and Thai chillis and stir for 1 minute until fragrant.\n* Add in 1 tbsp of the broad bean sauce, stir for 1 minute.\n* Add in your eggplant and pour in the sauce. Mix until everything is coated evenly.\n* Set Instant Pot to High Pressure and cook for 6 minutes. Let Natural Release for 5, and then Quick Release.\n* Serve over rice.\n\nFull recipe: [https://www.theflouredcamera.com/2021/02/14/chinese-eggplant-garlic-sauce-instant-pot/](https://www.theflouredcamera.com/2021/02/14/chinese-eggplant-garlic-sauce-instant-pot/)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
26	Venison Chili	Recipe:  \n **Ingredients**\n\n* Red Kidney Beans, 1lb Bag Dried\n* Garlic Powder, 1 Tbsp\n* Onion Powder, 1 Tbsp\n* Creole Seasoning, 2 Tbsp\n* Cooking Oil, 3 tsp\n* Ground Venison, 3lb\n* Sweet Onions, 2 x Large\n* Green Bell Pepper, 1 x Large\n* Celery, 2 x Sticks Large\n* Chopped Carrots, 1/2 Cup\n* Chopped Garlic, 2 tbsp\n* Rotel, Original 1 x Can 10oz\n* Tomato Paste, 2 tbsp\n* Diced Tomatoes, 1 x Can 14.5oz\n* Tomato Sauce, 5 x Cups\n* Bay Leaves, 3 x Large\n* Cumin, dried 2 x Tbsp\n* Chili Powder, 2 x Tbsp\n\n### Instructions\n\n1. Soak beans overnight in water with 1 tsp Garlic Powder, 1tsp Onion Powder and 1tsp Tony Chacheres Creole Seasoning\n2. In 3 tsp cooking oil Brown the ground meat with 2 tbsp Creole Seasoning, until almost cooked through still slightly pink). Drain the fluid and set aside.\n3. Chop Onion, Celery and Bell Pepper in Food Processor.\n4. Take this and add to dutch oven Pot - cook on medium heat.\n5. Add carrots to food processor and chop on high speed to get them as fine as possible. Add to pot.\n6. Cook until onions are sweating and translucent.\n7. Add garlic and cook a further 2 minutes.\n8. Add Tomato Paste and mix together cooking for a further 2 mins.\n9. Add Rotel, Diced Tomatoes and Tomato Sauce. Keep cooking on medium.\n10. Once bubbling add ground venison back to the pot and mix together.\n11. Add beans according to your preference.\n12. Add bay leaves, cumin and chili powder, mix together well and turn heat down to idle on low for about 4 hours.\n13. Remove bay leaves and serve.\n\n### Notes\n\nCooking time can vary depending on heat applied. It can be ready quicky, you would have to watch the pot closely though. Check the beans for done-ness.\n\nThis recipe is also *PERFECT* for the crockpot!\n\nThe dutch oven is not a deal breaker. Any large pot will do.  \nMore Pics and info here: [https://thecaglediaries.com/recipes/dinner-recipes/best-deer-chili-recipe-ever/](https://thecaglediaries.com/recipes/dinner-recipes/best-deer-chili-recipe-ever/)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
27	Wontons with Chilli Oil	Full recipe can be found [here](https://beesbites.com.au/vegetable-wontons-with-chilli-oil/). \n\n**INGREDIENTS**\n\n* Store bought wonton wrappers (about 60 wrappers) \n* 1/4 cabbage head \n* 1 carrot \n* 3cm ginger\n* 2 cups shitake mushrooms (dried or fresh) \n* 2 stalks spring onion\n* 2 tbsp sesame oil\n* 4 tbsp soy sauce\n* 2 tbsp rice wine vinegar \n* Pepper to taste (Approx. 1/2 teaspoon and preferably white pepper)\n\n**METHOD**\n\n1. Take dumpling wrappers out of the freezer to defrost while you get everything else ready. \n1. Finely shred the cabbage and carrot. \n1. Finely mince the ginger and mushroom. If using dried shitake mushrooms, you'll have to soak it in water for five minutes before using. \n1. Finely slice the spring onion. \n1. Add the sesame oil to a wok or pot. Add the ginger, frying for 20 or so seconds till aromatic. Then add the cabbage and mushrooms. \n1. Cook till the cabbage and mushroom has softened and till most of the water has cooked out. \n1. Add the carrots and spring onion, mixing well. \n1. Add the soy sauce, rice wine vinegar and pepper and mix well. \n1. Cook for another couple of minutes and then turn the heat off and let the mixture cool. \n1. Take one dumpling wrapper at a time, laying it in the palm of your hands and cupping slightly so a well forms in the middle. \n1. Place about one tablespoon of the mixture in the middle of the wrapper. \n1. Dab half of the wrapper with water and then fold over in half or take one corner and fold into a triangle. \n1. Press down on all sides, making sure there are no gaps or holes. \n1. Keep going until you've run out of wrappers or filling. You should get 60 wontons from this recipe. \n1. To cook the wontons, bring a pot of water to a boil and drop the wontons in. Do it in batches, don't overcrowd the wontons.\n1. Boil for about two to three minutes. You'll know it's cooked when the skin starts to look translucent and you can see the filling through the skin. \n1. Take them out and serve them fresh with chilli oil and dumpling sauce. \n1. Enjoy!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
28	Fluffy Souffle Omelette!	Below you can find the recipe:\n\nShoppinglist  \n2 eggs  \n13 grams of sugar   \nSalt   \nButter for cooking\n\nþInstructions\n\n1. Get a mixing bowl and seperate the yolk from the egg white (2 eggs).\n2. Add a pinch of salt to the egg yolks and mix everything.\n3. Whisk the egg whites until you get soft peaks. Use a whisk or a kitchen machine.\n4. Add 13 grams of sugar to the egg whites and mix everything.\n5. Add the egg yolk to the egg whites. Gently stir everything together.\n6. Heat a pan and add butter. When the butter is melted add the mixture to the pan.\n7. Fold the souffle egg in to shape.\n8. Bake the souffle egg for another 3 to 5 minutes\n9. Fluffy Souffle Omelette on Youtube if your interested in the video instructions.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
29	Cheddar Broccoli Soup	Ingredients:\n\n\n4 tbsp Unsalted Organic Butter\n\n1 large Onion chopped\n\n3 Cloves Garlic chopped\n\n3 Carrots Peeled &amp; Chopped (small pieces)\n\n1 tsp Cumin\n\n1/4 tsp Sea Salt\n\n3-4 C Broccoli Florets\n\n1/8 tsp Pepper\n\n2 C Water\n\n1.5 C Oat Milk Creamer other non dairy creamers also work\n\n8 oz Cabot Vermont Sharp Cedder Cheese grated\n\nDirections:\n\n1.\t` In a 4 quart soup pot melt butter.  Add onion and season with salt.  Sautés until translucent.  Add Carrots and Broccoli.  Sautés for another few minutes (until the broccoli turns bright green).  Add water, cumin and pepper.  Cover and simmer for 10-15 minutes or until the carrots are soft.\n2.\tBlend in Vitamix and return to pot.\n3.\t` Add Oat Creamer and Grated Cheese &amp; stir in until smooth to prevent cheese from sticking to the bottom of the pot.  Enjoy! \n\n[Recipe Link](https://www.eatingworks.com/keto-broccoli-and-cheddar-soup/)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
30	Vanilla Funfetti Cookies (Recipe)	Link: [https://www.sarahfreia.com/blog/gluten-free-vanilla-funfetti-cookies-recipe](https://www.sarahfreia.com/blog/gluten-free-vanilla-funfetti-cookies-recipe)\n\nIngredients\n\n* 3/4 cup (115g) butter\n* 2 tsp vanilla extract\n* 1/2 cup (100g) powdered sugar\n* 1 cup (200g) granulated sugar\n* 2 eggs\n* 3 (300g) cups flour \n   * *If using gluten-free flour, add 1/2 tsp xanthan gum*\n* 1 tsp baking powder\n* 1/4 tsp salt\n* 1/2 cup rainbow sprinkles\n\nDirections\n\n1. Preheat oven at 350°F (180°C)\n2. In a large bowl, cream together **3/4 cup (115g)** **butter**, **1/2 cups (100g)** **powdered sugar**, **1 cup (200g) granulated sugar**, and **2 tsp** **vanilla**.\n3. Add **2 eggs**, and mix until well combined\n4. Add in **3 cups (300g) flour**, **1/4 tsp salt**, and **1 tsp** **baking powder**\n5. Mix together until just combined\n6. Add in **1/2 cup rainbow sprinkles** (or more& you make it as multicoloured as you want)\n7. Gently stir all of the ingredients together until just blended \n8. Line a baking tray with **parchment paper** \\- OR - **cooking spray** \n9. Take golf ball sized portions of dough, and roll them together between your palms, then evenly space each ball onto baking tray\n10. Bake the biscuits in the oven at 350°F (180°C) for 12-13 minutes\n11. Take them out, and allow the Funfetti Cookies to cool for a minimum of 15 minutes\n12. ***Enjoy!***	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
31	Chicken and Rice Enchilada Skillet	\n\n**Ingredients:**\n\n2 tbsp  olive oil\n\n2   chicken breasts (boneless, skinless)\n\n1  onion\n\n2 clove  garlic\n\n\nsalt\n\nblack pepper\n\n\n\n**Directions:**\n\nDice the onion and chop the garlic and chili pepper. Season the chicken with salt and pepper. \n\n\nAdd the crushed tomatoes and chicken broth. Bring it to a boil.\n\nAdd the rice, cover and lower the heat. Cook according to rice directions.\n\nMeanwhile, shred the chicken.\n\nWhen the rice is cooked, add the beans, corn, and chicken. Stir to combine.\n\nSprinkle half the cheese on top. Cover and cook until melted. Serve with chopped cilantro, sour cream, and guacamole if desired.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
32	Newish to cooking, first time I've tried to spice up meat in this Chicken Shawarma, it was very nice	\n\n## INGREDIENTS\n\n* 1 lb boneless skinless chicken breasts (2 large breasts)\n* 1 lb boneless skinless chicken thighs (4 large thighs)\n* 6 tbsp extra virgin olive oil divided\n* 2 tsp cumin\n* 2 tsp paprika\n* 1 tsp allspice\n* 3/4 tsp turmeric\n\n\n## Oven Cooking Method\n\n1. Preheat oven to 400 degrees F. Spray the baking sheet with nonstick cooking oil. Place the chicken pieces on the sheet, evenly spaced.\n2. Place the chicken in the oven. Let it roast for about 15 minutes until cooked through, turning the chicken pieces once with tongs halfway through cooking.\n3. Take chicken out of the oven and let it cool slightly. Use a sharp knife to slice the meat into small, thin shawarma-like pieces.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
33	7Up Cake	Or it would send your pancreas into overdrive - 3/4C 7up is ~29g of sugar + 603g of added sugar (1C = 230g)\n\nSo if you divide the cake into 8 equal pieces (657g total) &gt; ~82g of sugar per slice\n\n Or even 16 equal slices &gt; 41g of sugar per slice \n\nI know Im being a Debbie Downer, but Ive had to watch what I eat more closely as I got older.  The days when I could dunk and obliterate a sleeve of Oreos before dinner are long gone.\n\n*** Thank you to the people below who caught my error by not accounting for 3 cups of sugar when I had only one.  Just for fun, lets figure out the fat and carbs - \n\n3 sticks of butter [92g of fat, 243mg of cholesterol per stick]: 276g total fat (174g saturated, 11g trans), 729mg of cholesterol, 2430 calories\n5 eggs [4.8g of fat, 186mg of cholesterol &amp; 6.3g of protein per egg]: 24g total fat (8g saturated), 935mg of cholesterol, 31.5g protein, 390 calories\n3 cups of AP flour: ~4g fat, 285g of carbs, 39g of protein, 1365 calories\n7-up, 3/4 cup: 19g sugar, 19g carbs, 70 calories \nWhipping cream, 6oz: 60g of fat (42g saturated), 240mg of cholesterol, 600 calories \nCaster sugar, 1/4C: 29g sugar, 30g carbs, 120 calories\n3C of cane sugar: 603g sugar, 603g carbs, 2322 calories\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
34	Pecan Cheesecake Brownies	# Ingredients\n\n**Brownies**\n\n* 1/2 cup granulated sugar\n* 3/4 cup all-purpose flour\n* 2/3 cup cocoa powder, sifted \n* 1/2 cup powdered sugar, sifted \n* 1/3 cup dark chocolate chips\n* 1/3 cup pecans\n* 1/4 tsp sea salt\n* 2 eggs\n* 1/2 cup extra-virgin olive oil\n\n# Directions\n\n1. In a medium bowl, combine the sugar, flour, cocoa powder, powdered sugar, chocolate chips, toasted pecans, and salt.\n2. In a large bowl, whisk together the eggs, olive oil, water, and vanilla.\n3. Sprinkle the dry mix over the wet mix and stir until just combined. This will be quite thick.\n4. Pour the batter into the prepared pan, reserving ¼ of the mix to add later.\n\n**For the ch	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
35	Bread Jamun with Rabdi	Here is the recipe video: https://youtu.be/OcULX_KO0Wo\n\nIngredients:\n\nBread - 4 slices\n\nBrown sugar - 1 cup\n\nCashews &amp; Almonds - 1/4 cup chopped\n\nWhole milk - 1 cup \n\nSaffron milk - 2 tsp (optional)\n\n\nPreparation of this dessert is divided into three parts:\nA) Bread balls\n\nB) Sugar syrup\n\nC) Rabdi\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
36	!offee cookies recipe	 Ingredients: \n\n1. Chocolate bar (1 piece) \n\n2. Walnuts (3 oz / 100 g) \n\n3. Flour (8 oz / 250 g) \n\n4. Coffee (1 tsp) \n\n5. Butter (3 oz / 100 g) \n\n6. Egg (1 piece) \n\n7. Sugar (3 tbsp) \n\n8. Baking powder (1.5 tsp) \n\n9. Warm water (2 tbsp)\n\n!ooking method\n\n1. Mix coffee, butter, sugar, egg, flour\n2. Breaking chocolate \n3. Crush walnuts\n4. Mix and knead mixture \n5. Forming cookies \n6. Baking for 15 minutes at 350° F/ 180° \n7. Delicious homemade coffee cookies are ready! \n\n If youd like to watch me make this cake, you can check it out [here!](https://www.youtube.com/watch?v=ciuFC0o5CQM)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
38	Moist &amp; Fluffy Blueberry Muffins	**Ingredients:**\n\n1/2 cup (100 g) unsalted butter, softened at room temperature\n\n2 tbsp (30 g) flavorless oil (vegetable oil, etc.)\n\n1/2 cup (100 g) granulated gar or granulated white sugar (feel free to double the sugar for sweeter muffins!)\n\n3 eggs, room temperature\n\n2 tbsp lemon juice (about juice of half a lemon)\n\n2 3/4 cups (350 g) all purpose flour\n\n2 1/2 tsp baking powder\n\n1 cup (240 ml) milk, room temperature\n\n4 oz (around 100 g) blueberries + a sprinkle of all purpose flour\n\n**DIRECTIONS:**\n\n1. Grease a muffin pan and line it with 12 muffin paper liners. Preheat the oven to 375 F\n\n2. Combine softened unsalted butter, sugar, vegetable oil and mix until creamy.\n\n3. Mix in egg one at a time. Combine until well incorporated (don't over mix).\n\n4. Add lemon juice and sift in flour and baking powder; add in milk in 3 batches and mix until well incorporated and smooth (don't over mix).\n\n6. Coat blueberries in a sprinkle of flour and set aside\n\n7. Divide the batter evenly into 12 muffin cups, and add in blueberries to each (the muffin cups will be fully filled so that you'll get bakery style muffins with high-dome)\n\n8. Bake at 375F for around 20-23 minutes, or until a toothpick comes out clean. Enjoy!\n\nLink to video instructions [here](https://youtu.be/pkuRiIn6VYo)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
39	Apple Flan	  Video recipe :[Apple flan](https://youtu.be/c3yF1Ce3xZE)\n\n  \n**Ingredients:**  \n\n*  5 eggs  \n*  750 g apple \n*   370 g of condensed milk \n*   3 tablespoons of sugar (for the caramel)  \n\n  **instructions**  \n\n*  Peel and cut into pieces 750 g of apple \n*  Put the apples in a saucepan with a little water and cook them for 15 minutes over medium heat. \n*  Drain the apples \n*  Reserve a few pieces of apple and mash the rest with a fork   \n*  In a saucepan, pour 3 tablespoons of sugar, put on a medium heat and let it melt slowly, without stirring.  \n*  When a caramel layer is created at the bottom, mix to speed up caramelization.\n*  Pour the caramel into the mold and put the apple pieces that we have reserved  \n*  Beat 5 eggs  \n* Add 370 g of condensed milk to the apples and mix \n*  Add the beaten eggs and mix \n*  Pour the mixture into the mold \n*  Put the mold on a tray with water, bake in a water bath at 180 ° C, until the flan is set (approximately 45 to 60 minutes)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
40	Fried Rice with Bak Kwa (Chinese New Year Edition)	**Ingredients List:**\n\n" 5 Cloves of Garlic \n\n"Half an Onion \n\n" 1 Carrot \n\n" 1/8 of a Cabbage \n\n" 2 Eggs \n\n" 100g of minced meat \n\n" Overnight / Leftover Rice \n\nSeasoning : \n\n1. Prepare the vegetables by dicing up the carrot, garlic and onions while shredding the cabbage.\n2. Prepare the minced meat by seasoning it with sesame oil, shaoxing rice wine, white pepper and soy sauce.\n3. Brown the minced meat and remove from wok. \n4. Sauté the vegetables on high heat, starting with the onion and carrots, then the garlic and cabbage 1min later. Remove from wok when slightly softened.\n5. Crack 2 eggs into a bowl, adding white pepper and salt. \n6. Cook the egg in the wok on medium high heat, stirring frequently to form curds. Add in the leftover rice once the egg in the wok has set. \n7. Break up the clumps of rice by pressing down with the spatula. \n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
41	Rich Chocolate Cake with Ganache Glaze	INGREDIENTS\n\nCake\n* 1 cup freshly brewed hot coffee\n\n\n* 1/2 cup Unsweetened natural cocoa powder\n\n\n* 3/4 cup packed light brown sugar\n\n\n\nPREPARATION\n1. Preheat the oven to 350°F. Prepare a 10-inch round cake pan by greasing it with cooking spray and then lining the bottom with parchment paper.\n2. To make cake, pour the hot coffee into a medium bowl and stir in the cocoa powder until it dissolves. Stir in the brown sugar, followed by the sour cream and the vanilla. Stir thoroughly.\n3. Using a mixer, beat the butter and granulated sugar on medium speed until light-yellow and fluffy,Add the eggs and mix for 2 minutes.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
42	Poor Man's Kimchi Jjigae/Stew!	Here is my poor man's version of kimchi jjigae! It's super tasty, filling, and almost embarrassingly quick to make. A perfect trifecta.\n\nI really like tuna in my kimchi jjigae because it's simple to add, and the tuna brine adds a lot of flavour to the broth. If you're not a fan of tuna you can use any meat - add at the beginning with the kimchi and saute for a bit longer and don't forget to season the meat. Also feel free to add more ingredients, like tofu and other veggies. \n\nPlease refer to [my video](https://www.youtube.com/watch?v=M-AJVVXbg7I) for more detailed steps and tips!\n\nIngredients:\n\n* 1 green onion\n* 2 garlic cloves\n* 1/2 onion\n* 1/2 cup kimchi\n* 2 tbsp kimchi brine\n* 1 tbsp gochugaru (Korean red pepper powder)\n* 1 can of tuna\n\nSteps:\n\n1. Chop green onion and onion. Mince garlic cloves.\n2. Heat up a saucepan to medium heat with some oil and saute kimchi and garlic together for 3-5 minutes.\n3. Add tuna and onion, and bring it back up to heat while mixing occasionally.\n4. Add just enough water to cover everything and add kimchi brine and gochugaru.\n5. Bring it up to boil, and let it boil for 5 minutes.\n6. Season with salt to your taste if needed. It depends on how salty your kimchi is.\n7. Enjoy with rice and banchans (side dishes)!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
43	Basque Style Burnt Cheesecake!	Shoppinglist  \n200 grams of Philadelphia Cream Cheese  \n70 grams of sugar  \n1 egg yolk  \n2 eggs  \n5 grams of cake flour  \n115 grams of fresh cream\n\nþInstructions\n\n1. Start with adding 200 grams of Philadelphia Cream Cheese to a mixing bowl.\n2. Next add 70 grams of sugar and mix everything until the mixture gets smooth.\n3. Then Add 1 egg yolk to the mixture and mix everything.\n4. Thereafter add 2 beaten eggs to the mixture.\n5. Add 115 grams of creme fraiche to the mixture and mix everything together.\n6. Next add 5 grams of cake flour.\n7. Preheat the oven to 220 degrees celsius.\n8. Put the mixture in a greased 19 cm baking pan.\n9. Bake the cake for 20-25 minutes.\n10. After baking let the cake cool for 30 minutes. When the cake has cooled, cool the cheese cake overnight.\n11. Video instructions on youtube: easy basque style cheesecake	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
93	Baked Rice with Milk	 You can find the full recipe here :  [Baked Rice with Milk](https://youtu.be/v73EvGQYCls)\n\n **Ingredients:**  \n\n* 1/2 cup of rice (100 g) \n* 5 cups of milk (1250 ml) \n* 1 cup of water (250 ml)\n*  1 cup of sugar (200g) to taste \n* 1/2 cup of milk (120 ml) \n* 1- 1/2 tablespoon cornstarch (0 g\n*  1 teaspoon vanilla or (cinnamon)   \n    \n  **Instructions**  \n* In a saucepan put, 1/2 cup of clean rice, washed, and 1 cup of boiling water   \nCover and cook over low heat, until evaporate the water \n* Add 5 cups of milk and stir every 5 minutes so that the rice does not stick to the casserole \n* After 15-20 minutes add 1 cup sugar and vanilla \n* Add 1/2 cup of milk, 1 tablespoon and 1/2 cornstarch (well mixed) \n*  Mix quickly, to avoid lumps \n* Pour the rice into suitable pots or containers for the oven \n*  Bake in the upper part of the oven until that has a golden color on top \n*  Let cool to room temperature, cover and refrigerate	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
44	Orange-Maple Glazed Duck	**Recipe here originally:** [**Orange-Maple Roast Duck**](https://www.triedandtruerecipe.com/2021/02/14/orange-maple-roast-duck-recipe/)\n\nThis is such an easy recipe and I can't believe I waited this long to roast whole ducks! This is now my second time roasting a whole duck and I love it.\n\n# Ingredients:\n\n* 5-6 pound whole pekin duck; giblets and neck removed (As you can see, I didn't detach my neck and just left it in the cavity...but if you have kitchen shears, feel free to remove the neck and use it in stock/gravy)\n* Salt, pepper\n* 8 clementines, divided\n* 3-4 shallots\n* 4 star anise pods\n* 1/2 cup maple syrup\n* 1 teaspoon dijon mustard\n\n&amp;#x200B;\n\n# Method:\n\n* Preheat oven to 350ºF.\n* Pat the duck dry and prick all over with a fork, or use a knife to create angled slits along the breast. Cut into the fatty parts around the drumsticks. You just want to make enough slits around the fatty part of the duck skin so that the fat renders out.\n* Peel the shallots and quarter. Quarter 4 of the clementines. Stuff the duck with the clementines and shallots and tie the legs together. Season the duck liberally with salt and pepper.\n* Line a baking sheet with foil and place a raised rack on the foil. Place the duck on top and transfer to the oven, breast-side up,  for 1 hour.\n* Flip the duck and cook, breast-side down, for 1 more hour.\n* Remove the duck from the oven. At this point, you can drain off the duck fat and reserve it for another use.\n* Roast the duck, breast-side up for 40 minutes more.\n* In a saucepan, combine the juice of remaining 4 clementines, maple syrup, 4 star anise pods, and 1 teaspoon dijon mustard. Bring to a boil and whisk until smooth. Reduce heat and simmer for 10 minutes. Turn off the heat.\n* Remove the duck from the oven and brush half the glaze over the duck. Return to the oven for 20 more minutes.\n* Brush the duck with the remaining glaze and bake for 10 minutes. Turn on the broiler and broil for 4-5 minutes until the skin darkens on top, being careful not to burn the sugars in the glaze.\n* Remove from oven and serve! (If you're animals like us, you'll just sit and pick it clean instead of even carving it, lol)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
45	Caramel Apple Creme Brulee (eggless recipe)	**Ingredients:**\n\n1. ½ apple\n2. Caramel (to taste, \\~3tbsp)\n3. 100ml coconut milk\n4. 100ml soymilk (or any other milk)\n5. 25g brown sugar\n6. 15g tapioca starch (or any kind of starch)\n7. 1tsp cinnamon\n8. ¼ tsp agar agar\n9. ¼ tsp vanilla extract\n\n**Instructions:** [Demonstration](https://youtu.be/To-FCRgGfUA)\n\n1. Peel apple and slice thinly. Line the bottom of ramekin with apple slice and caramel.\n2. Mix coconut milk, soymilk, sugar, tapioca starch, cinnamon, agar agar, vanilla extract, and blend for about 1 minute.\n3. Pour mixture in a pot on medium and stir until it thickens up.\n4. Pour into your ramekin over your apple. Cool in the fridge for about 1hr.\n5. Hot spoon method: In a hot pot use about 3 tbsp sugar and 1tsp water. Give it one swirl and do not agitate pot again. Let the sugar melt and turn brown. Pour this over crème brulee to get a thin coat\n6. Enjoy =\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
46	Tuscany Rice Fritters, a Classic Carnival Dessert	 Italian rice fritters are typical of the Carnival time, made with rice, milk and lemon zest, deliciously coated with sugar with a delicate flavour of rum. As always if you like the recipe and want to subscribe you are welcome\n\nVideo Recipe [HERE](https://youtu.be/OJ4d_ChZRpQ)\n\nINGREDIENTS\n\n* 500 ml whole milk\n* 1 glass of water\n* rice 150 gr\n* All purpose Flour 2 Tablespoons\n* eggs 2\n* Butter 30 gr\n* Sugar\n* Lemon Zest\n* Sultanas 50 gr\n* Rhum about 130 gr\n* Instant baking powder 7 gr\n* pinch of salt\n* seed oil\n\nINSTRUCTION\n\n* in a pot put: 500 ml of whole milk, a glass of water, 2 tablespoons of sugar, a pinch of salt, 30 g of butter, a piece of lemon peel and bring to the boiling point.\n* add 150 g of rice cook the rice until the liquid is completely absorbed, turning the rice often to prevent it from burning.\n* transfer the rice to a bowl and allow it to cool.\n* in the meantime, leave 50 g of sultanas to re-hydrate in a bowl of water, 30 minutes will be enough.\n* when the rice is cold, add 2 tablespoons of flour and 1 egg. mix well.\n* When the egg has been absorbed into the rice, add a teaspoon of grated lemon rind, another egg and half a sachet (7 grams) of instant baking powder.\n* Mix well then add half a glass of rum ( about 130 gr ) and the drained sultanas.\n* let the dough rest for one hour\n* Fry the mixture in spoonfuls in hot seed oil.\n* The fritters are cooked when they are golden brown. As soon as they are cooked, place them on absorbent paper to dry the excess oil.\n* Sprinkle with plenty of sugar before serving.\n\nThat's all! if you have any question feel free to ask \\^\\_\\^	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
47	Seafood Newburg Recipe	\n\n### INGREDIENTS \n\n* 1-1/2 Tbsp extra-virgin olive oil\n* 1/2 lb cod (or any firm white fish), cut into 1" pieces\n* 1/3 lb medium shrimp (about 12), peeled and cleaned\n* 1/4 lb sea scallops (about 4), quartered\n* 1/3 tsp kosher salt\n* 1/3 tsp freshly cracked black pepper\n* 1 Tbsp freshly squeezed lemon juice\n\n\n### INSTRUCTIONS \n\n* Put all the seafood in a bowl and season with 1/3 tsp kosher salt and 1/3 tsp freshly cracked pepper. \n* Heat 1-1/2 Tbsp olive oil in a non-stick pan over medium heat. \n* Add shrimp, fish, and scallops, and cook for about 6 minutes total, stirring occasionally. Make sure the pan is large enough that the seafood isnt crowded. If they touch each other, theyll steam. Cook in batches if necessary. \n* When done cooking, remove from heat, put in a bowl, and squeeze some fresh lemon juice over it (about 1 Tbsp).\n* In the same pan, heat 2 Tbsp butter until the butter bubbles but doesnt smoke. \n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
48	Chargrilled Oysters	 RECIPE\n\n### Ingredients\n\n* 2 Dozen Oysters, on the half shell\n* 1/2 Cup Butter, salted\n* 2 Tbsp. Garlic, minced\n* 1 Tsp. Black Pepper\n* 1/2 Tsp. Creole Seasoning\n* 2 Tsp. Chopped Parsley\n\n\n### Instructions\n\n1. Light your grill. If using a gas grill allow the temperature to settle at med-high. If using charcoal you'll want to add the oysters to cook once the coals have turned white and stopped smoking.\n2. After opening the oyster shells lay the oysters out on a tray (try to preserve some of the juice inside if they have any)\n3. In a bowl melt the butter, add the garlic, black pepper, creole seasoning and chopped parsley and stir until combined.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
49	Folded BLT Avocado Ham &amp; Cheese Gimbap	Ingredients:\n\nSeaweed Sheet 4 pcs\n\nSteam Rice 60g\n\nBacon 3 pcs\n\nLettuce 4 pcs\n\nTomato 2 pcs\n\nAvocado 1/2pc\n\n\n1. Cut lettuce into a small square shape.\n\n2. Sliced tomato &amp; avocado.\n\n3. Cut the bacon in half &amp; pan-fry until crispy.\n\n4. Beaten the egg, pan-fry in a round shape, cut in half.\n\n5. Take the seaweed sheet\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
94	Pressure Cooker Taiwan Braised Pork Rice Bowl	### Ingredients\n\n* 3 eggs boiled and peeled\n* 450 grams pork belly sliced thin\n* 1 tbsp Shaoxing wine sub dry sherry\n* 1 shallot diced\n* 2 scallions chopped\n* 2 cloves garlic diced\n\n\n* Boil 3 eggs. Cool in an ice bath and peel. Set aside.\n* Slice pork belly into thin strips, about 1 cm in width. Marinate in shaoxing wine for 20 minutes.\n* Heat your skillet and saute the pork belly. Continue to stir and use a spatula to scrap the brown bits. Wait until the natural oils begin to heat up on the pan.\n* Add in diced shallots and cook until shallots have released their fragrance.\n* Added in scallions and garlic. Stir until garlic has begun to brown.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
50	Pork Pozole Verde	__Ingredients__\n\n* 2 1/2 pounds pork, assorted\n\n* 1 pound of tomatillos, husked and halved\n\n* 2 poblano peppers, veins and seeds removed\n\n* 2 jalapeno or serrano peppers, veins and seeds\n removed\n* 1/2 cup cilantro, loosely chopped\n\n* 2 teaspoons of dried oregano\n\n* 6 cloves of garlic\n\n* 2 onions, one cut into chunks, one diced\n\n* 6 cups of chicken stock or broth\n\n\n\n\n__Preparation__\n\nIn a blender combine the garlic, cilantro, one chunked onion, jalapenos, poblanos, and tomatillos with 1 cup of the chicken stock or broth. It will need to be fully processed, so its best to do it a little at a time.\nWarm 1 tablespoon of oil in a large skillet over medium heat. Add the blended green sauce to the skillet and then bring it to a boil.\n\nReduce the sauce to a simmer and stir occasionally until the sauce thickens, which takes up to 20 minutes. Remove from heat and salt/pepper to taste.\nAlongside cooking the green sauce, heat the other tablespoon of oil in a dutch oven or large soup pot to brown the meat.\n\nBrown the pork a little at a time, take it out and set it aside.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
51	Oven-Baked Italian Meatballs (All Beef)	\n**Ingredients:**\n\n* 1/2 cup Italian bread crumbs\n* 2/3 cup milk, or beef broth\n* 1 lb. ground beef\n* 1/4 medium onion, finely diced or grated\n* 2 cloves garlic, minced\n* 1 large egg\n\n1. Preheat the oven to 400°F (200°C) and line a baking sheet with parchment paper or a baking mat.\n2. In a large mixing bowl, add Italian bread crumbs and milk. Combine well and set aside while preparing the other ingredients, for at least 5 minutes.\n3. Add ground beef, onion, garlic, egg, salt, black pepper, parmesan cheese, and parsley into the soaked bread crumb mixture, and mix with your hands until just combined. Do not overmix.\n4. Portion onto the prepared baking sheet (using a cookie or ice cream scoop will make it easier). Wet your hands with water, and roll meatballs into 2" diameter balls.\n5. Bake for about 15-20 minutes, or until the meatballs have reached an internal temperature of 165ÚF (74°C).\n6. Remove from oven and drain off any excess fat. Serve with your favorite sauce and enjoy!\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
52	Pressed Cabbage Salad with Ginger Miso Vinaigrette	INGREDIENTS\n\n"        `1/3 rd C Rice Wine Vinegar\n\n\n"        `1 C Toasted Sesame Oil\n\n\n"        `2 T Mellow White Miso\n\n\n"        `4 T Ginger Chopped\n\n\n\nINSTRUCTIONS\n\nGinger Miso Dessing:\n\n"        `Emulsify all of the ingredients in a Vitamix until smooth.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
53	Slow-Cooked Duck Wraps with Homemade Hoisin Sauce	Super tender duck legs slow-cooked in Chinese five-spice, served with cucumber salad, homemade Hoisin sauce and corn-wheat wrap. Best way to celebrate the upcoming Chinese new year!\n\nMakes 2 portions (4 wraps)\n\n**Ingredients for wraps:**\n\n* 2 duck legs\n* 1L (1.05quarts) of stock or more (vegetable or chicken, needs to cover the meat)\n* Chinese 5 spice (1 cinnamon stick, 5-star anise, 20 peppercorns, 2tsp of fennel seeds, 20 cloves)\n* 4 small corn-wheat wraps (you can use any wraps but these have slightly yellow colour that contrasts nicely with the dish)\n* half cucumber, seeds removed, sliced\n* 80g (2.8oz) of mixed salad (spinach, lettuce, spring onions and beetroot cut julienne)\n* half red chilli sliced for garnish\n* fresh coriander for garnish (optional)\n\n**Ingredients for Hoisin sauce** **(makes more than you need for this recipe):**\n\n=÷=÷\n\n**Instructions:**\n\n**1.** In the slow-cooker on high setting or medium-size pot on the stove: Simmer **duck legs** in **1L of stock** and **Chinese 5 spice** for **3-4 hours** (make sure meat is submerged, when ready meat should fall off the bone). In the meantime prepare Hoisin sauce and salad.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
54	How to make yeast at home, Sourdough	\n\n  **Ingredients:**  \n\n* Day 1: -  50 g of wheat flour   \n\n\\- 50 ml of water at room temperature  \n\n\\-5 raisins or 1 date or  1  teaspoon of honey \n\n*  Day 2: -50 g of flour  \n\n\\-50 ml of water at room temperature  \n\n* Day 3 -100g of flour  \n\n\n**Instructions**\nwater at room temperature. Mix well and let stand 24 hours at room temperature \n\n*  10-Discard all the dough except 100 g and add 100 of flour or wholemeal flour and 100 ml of water at room temperature. Let rest 24 hours again  \n*  From this moment the dough should be fermenting and making bubbles   \n\n\n* \\- You have to repeat the same process on day 4 Discard all the dough except 100 g, add 100 g of flour or wholemeal flour and 100 ml of water at room temperature. Let it rest for 24 hours again. The sourdough is active.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
55	Tart with Almonds and Sour Cherries	\n\n* Butter: 130 g\n* Flour: 240 g\n* Powdered Almonds: 50 g\n* Powdered Sugar: 100 g\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
56	Leftover Rice Fritters!	Leftover rice fritters can be made in 15-20 mins and its a best starter for a game day! \n\nHere is the step by step: https://youtu.be/x9heO_8phIY\n\nIngredients:\n\n1 cup of leftover rice\n\n1 tsp of plain yoghurt/curd\n\n1 tsp of mustard seeds\n\n\n\nSalt to taste\n\nOil\n\nDirections:\n\n\n1) Add a 1tsp plain yoghurt/curd and grind the leftover rice to a coarse consistency\n\n2) Temper 3tsp of hot oil, by adding mustard seeds, green chilli &amp; ginger. And finally add it to the grinded rice.\n\n3) Mix a spoonful of all purpose flour with water and salt\n\n4) Make smaller rice balls\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
57	Vegan Crispy Tofu Middle Eastern Power Bowl	\n\n1. **Preheat oven to 420 degrees** \n2. **Press your tofu so that a majority of the moisture washes out. You can do this by covering the tofu in paper towels and placing a heavy object on top (press for a minimum of 30 minutes) the longer you press the crispier the tofu. If you got time shoot for an hour!** \n3. **Cook your rice, and heat up your canned Fava beans. Ideally you have the real stuff and can cook your fresh beans.**\n4. **Once Tofu is finished being pressed, chop your tofu in one inch squares.** \n5. **Toss chopped tofu in large mixing bowl and add in your corn starch, spices, olive oil, and lemon juice**\n6. **Mix throughly with hands, get in there and cover those bad boys!**\n7. **On a baking sheet separate your marinated tofu blocks, make sure you leave some space between blocks, this will help crisp up the tofu** \n8. **Toss baking sheet in oven, and let bake for 30-45 minutes, check every 30 minutes. Take out when it feels nice and crispy**\n9. **While tofu is cooking, put fresh dill and mix Fava beans into white rice pot. Add in salt and lemon juice, mix and leave on low with the lid on.** \n10. **Chop up onions, tomatoes, cucumbers, and parsley and mix in a bowl. Add in your Shirazi salad spices with olive oil and lemon juice. Mix well.**\n11. **Pull out tofu, plate everything together and add any garnish. I added white onion and jalapeños, but feel free to go your own way on this!**	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
58	Sourdough Chinese Scallion Pancakes	\\*Updated recipe!\n\nSo doing this with sourdough starter mainly cause I bake bread every week, but you can easily substitute the starter with equal parts dough and water! I think the sourdough starter adds a minimal difference, I just don't like throwing away all the discard each time! ;) Recipe below:\n\n## Ingredients\n\n* 140 grams all purpose flour\n* 70 grams sourdough discard (100% hydration)\n* 50 grams warm water\n* 1 tsp salt\n* 1 tbsp vegetable oil (for filling)\n* 2 scallions (chopped)\n* 3 tbsp vegetable oil (for cooking)\n* Rice flour (for dusting)\n\n## Instructions\n\n* Mix sourdough discard, flour, and water in a bowl until dough is easy to work with and smooth. Cover with a dish towel and let sit for 1 hour.\n* Flour surface and knead salt into dough. Roll out dough into a thin rectangle (as thin as possible without the dough ripping)\n* Spread vegetable oil evenly across the dough, sprinkle scallions.\n* Roll dough from the bottom up until it resembles a thin egg roll. Pull the dough lengthwise.\n* Cut the dough in half. Roll each half into a spiral shape.\n* Flatten each piece of dough and roll with a pin until thin. Each pancake should be about 6-7 inches in diameter.\n* Heat a pan with oil until hot. Cook the pancakes for 2 minutes on each side or until golden brown.\n* Serve with sauce.\n\nYou can find the full recipe here: [https://www.theflouredcamera.com/2021/02/07/sourdough-chinese-scallion-pancakes/](https://www.theflouredcamera.com/2021/02/07/sourdough-chinese-scallion-pancakes/)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
59	Roast leg of lamb	Video recipe :[Roast leg of lamb](https://youtu.be/iJpF1ZyqH6c)\n\n**Ingredients:**\n\n*   2-3 kg Leg of lamb\n*  1/4 cup Oil\n*   1 teaspoon onion powder \n* 1 teaspoon black pepper\n*   Salt \n* 1 tablespoon of sweet paprika\n*   1/2 turmeric  \n* 1 teaspoon oregano \n*  1 tablespoon ketchup \n*  2 tablespoons of plain yogurt \n*  8 cloves of garlic \n* 10 cloves in grain  \n* 3 cinnamon sticks\n*   2 bay leaves \n\n **Instruction**\n\n*  In a bowl put, 2tablespoons plain yogurt \n* 1/4 cup oil  \n* 1 teaspoon oregano \n*  1 teaspoon onion powder  \n* 1 teaspoon black pepper and salt \n* 1 tablespoon sweet paprika  \n* 1/2 teaspoon turmeric (optional)  1 tablespoon ketchup  \n*  Mix  \n* Pierce the meat with a knife  \n* Put the garlic in the holes  \n*  Coat a baking tray with oil  \n*  Put 10 cloves, 3 cinnamon sticks and 2 bay leaves on the tray \n* Spread the leg of lamb with the sauce \n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
60	One pot Japanese curry!	Enjoy what Japan has to offer at the comfort of your own home! Cheap and simple recipe that you can make right now, with almost any vegetables and meats you have in your fridge.\n\nSTEP BY STEP DEMONSTRATION  &gt; [here](https://www.youtube.com/watch?v=OHbrdf10ZXQ)\n\nINGREDIENTS \n\n* 2 carrots\n* Three quarters of an onion \n* half a pack of Curry Cube \n* 600 mL of chicken stock \n* one pound of ribeye steak ( or any type of meat )\n* Two cloves of garlic\n\nSTEPS\n\n1. Start by dicing onion\n2. Peel and roughly chop carrots \n3. Dice steak into small cubes \n4. heat up a pot with olive oil on high heat\n5. Brown the meat make and sure not to fully cook it\n6. Take meat out and add vegetables\n7. Let vegetables Brown \n8. Add chicken stock \n9. Bring it to a boil and let it simmer for 15 minutes \n10. Stir in Curry cubes And simmer for another 5 minutes\n\nDONE	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
61	Chocolate Strawberry Steamed Buns	\n# Ingredients\n\nServing Size: \\~12 buns\n\n1 tsp yeast\n\n* 1/4 tsp sugar\n* 1/4 cup water, warmed up to 110-115oF\n* 1 &amp; 1/2 cups all purpose flour\n* 1 &amp; 1/2 tbsp of granulated sugar\n\n\n# Recipe\nEqually divide it into 12 pieces. Then cover them with a plastic wrap to prevent them from drying out while you assemble the buns. Take one dough ball and start rolling it out into a slightly thin disc. Then, roll out the outer part of the disc into a thinner layer. We want to have a disc-shaped dough with a thicker center and thinner outer layer. Then, using a small ice cream scooper, place 1 small scoop of strawberry preserves onto the center of the dough. Then, use your thumb and index finger to start folding a pleat all around the thin outer layer of the dough. When you get to the end, use your thumb and index finger to pinch the top of the dough and twist to completely close the bun. Then place it on a piece of parchment paper or cupcake wrapper, and repeat with the rest of the dough.\n* Once youve rolled out all your dough, then its time to steam them! Working in batches, place a few doughs into your steamer basket. Then place the steamer on a pan or wok filled with around 2 inches of water. Turn the heat on medium and let it steam for 12 minutes. After 12 minutes, turn off the heat and let it sit for another 5 minutes. After 5 minutes, take it out and let it cool for at least 30 minutes.\n* Once the waiting is over, take it out, remove the parchment paper from the bottom, and there you have it!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
62	Tiramisu without eggs	**Ingredients**\n\n* Mascarpone: 360 g\n* Condensed milk: 100 g (H 1/3 cup)\n* Fresh cream: 360 g (H 1 1/2 cup)\n* Champagne wafer: 20-28 (depends on the size of the tray)\n* Cold coffee without sugar as needed\n* Powdered cocoa as needed\n\n&amp;#x200B;\n\n**How to make** ([Link to video](https://youtu.be/KxRYdKNIn4o))\n\n1. In a bowl add mascarpone, fresh cream (or whipped cream mixture) and condensed milk.\n2. Mix with an electric mixer until firm\n3. Spread a thin layer of this cream on a platter, soak the cookies in the coffee and make a layer on top of the cream.\n4. Spread a generous layer of cream, make another layer of wafer and another with the rest of the cream.\n5. Sprinkle with cocoa powder.\n6. Take the refrigerator for at least two hours.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
63	Easy vegan Thai tofu ramen!	This vegan ramen recipe with tofu was so simple to make and it's even tastier than it looks in the picture! The coconut milk makes it so rich and creamy.\n\n[Here](https://www.kitchenful.com/lp/recipe/Thai-Tofu-Ramen-2828/rf) is the link to the original recipe if you want to check it out!\n\n&amp;#x200B;\n\n**Ingredients:**\n\n2 tbsp  olive oil\n\n14 oz  tofu\n\n1 tbsp  red curry paste\n\n\n\n**Directions:**\n\n1. Slice the mushrooms.\n2. Heat 1 tbsp olive oil in a skillet over medium high heat. Add the tofu and cook for about 10 minutes, or until lightly browned and crisp on all sides, turning occasionally.\n3. Meanwhile, in a medium sauce pan, heat 1 tbsp olive oil. Add the mushroom and cook for about 5 minutes, or until brown. Stir in the red curry paste and soy sauce.\n4. Add the water and coconut milk. Cook for about 10 minutes. Season to taste.\n5. Add the noodles and cook for about 3 minutes.\n6. Add the browned tofu and cook for another 3 minutes. Top with chopped green onions and serve.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
64	Onion Garlic Dip	Hello! Long time lurker, first time poster. This dip is an easy and delicious way to enjoy French onion dip kicked up a notch. The roasted garlic really brings this all together.\n\n **Ingredients**\n\n* 1 medium yellow onion (minced, about 1/2 cup)\n* 1/3 cup canola oil\n* Pinch salt &amp; pepper \n* 1/4 teaspoon sugar \n* 1 cup sour cream\n* 1 head of garlic \n* Dash of olive oil\n\n**Directions**\n\n1.\tPreheat oven to 375 degrees Fahrenheit \n2.\tTake head of garlic, chop off top exposing garlic inside. Wrap in foil with a dash of olive oil. Bake for 45 minutes.  Let cool off for 10-15 minutes unwrapped. \n3.\tHeat oil in fry pan on high heat for about 1 minute.\n4.\tOnce oil is hot. Lower gas to medium add onions with salt, pepper and sugar. Stirring every few minutes. Let cook until golden brown. About 10 minutes. \n5.\tSqueeze the garlic out of shell into a medium sized bowl. Add sour cream.\n6.\tStrain the cooked onions from the oil and add to bowl mixture.\n7.\tUse an immersion blender to make sure everything is fully blended together. \n8.\tLet cool in the refrigerator for 3+ hours. \n9.\tServe with ruffled potato chips.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
65	Pan Fried Fish Dumplings	Full recipe tutorial [here](https://youtu.be/Rvqk4hs0_ic)\n\nIngredients:\n\n 250g AP flour\n\n 1tsp salt\n\n 110g water\n\n 4 large shrimp\n\n 500g basa fillet\n\n 4 green onions\n\n\n\nDirections:\n\n1. First make the dough for the dumpling skin.  Start by mixing the flour, salt and water together in a large bowl.\n\n2. Once the mixture clumps together in pieces, bring it together into with your hands into a rough dough and begin kneading.  The dough will feel rough and dry at first but will become softer as you knead.  Continue for around 10 - 15 minutes until you get a smooth ball.  Cover and set aside to rest.\n\n3. Meanwhile make the filling.  Finely mince the green onion and ginger together.\n\n4. Add 2 tbsp oil to a pan over medium heat.  Once the oil is warm, add the green onion and ginger and stir for around 2 minutes until it forms a paste.  Toasting the onion and ginger this way helps to bring out the flavour more compared to simply adding it into the filling mixture raw.  Set aside to cool.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
66	Egg fried rice	\nINGREDIENTS\n\n\\- leftover rice ( enough for how ever many people )\n\n\\- 2 eggs\n\n\\- Splash Sesame oil\n\n\\- half tbsp. Mirin\n\n\\- 1 tbsp. Soy sauce\n\nSTEPS\n\n1. boil rice ( preferably leftover / overnight )\n\n2. mince garlic into similar size of a rice grain\n\n3. finely chop Birds eye chili and spring onions\n\n4. Separate 2 egg yolks from whites\n\n5. Mix rice and yolks together ( keep the whites for later )\n\n6. On medium-high heat add oil\n\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
67	Spaghetti and meatballs with spicy marinara	**Recipe:**  \n\n*Meatballs:*  \n- 2lbs ground beef (85/15 or 80/20)\n- one large yellow onion\n- 1 bunch of parsley (about 1 cup chopped)\n- 5 tbsp ketchup \n- 1 cup ground parm\n- 2 eggs\n- 2/3-1 cup Italian breadcrumbs  \n- salt to taste\n\n\n*Meatball Directions:*  \n\n1. Chop onion and parsley finely in food processor\n2. Combine meatball ingredients and mix well using hands  \n3. Roll into 1.5 meatballs  \n4. Bake at 400F for 20 mins and then 450F for 15 mins until golden and cooked through (you can also broil for a minute if youd like)  \n** tip: I often make a tiny tester patty that I cook in a pan to check for seasoning and adjust as needed **  \n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
68	Apricot Jam Thumbprint Cookies	Apricot Jam Thumbprint Cookies\n\n**Ingredients** \n\n* 1 cup almond flour \n* ¾ cups all-purpose flour\n*  ½ teaspoon plus a pinch of table salt \n* 1 cup (2 sticks) unsalted butter, at room temperature \n* ½ cup packed light brown sugar\n*  2 large egg yolks \n* 1 teaspoon vanilla extract\n*  1 cup apricot jam\n\n**Directions** \n\n1. In a medium bowl, whisk together the flour and the ½ teaspoon salt. \n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
69	Smoked Chinese Pork Jerky	The original recipe with more images and instructions video can be found [here](https://www.mylovelyrecipes.com/recipes/chinese-cuisine/braised-pork-leg/)\n\n&amp;nbsp;\n\n#####Preparation Time: One Day\n#####Cooking Time: 20 minutes\n#####Serving Size: 16 pieces\n\n&amp;nbsp;\n\n#INGREDIENTS\n- 500g Ground Pork\n- 1 tsp Fish Sauce\n- 1 tsp Oyster Sauce\n- 1 tbsp Huadiao Wine/Rice Wine\n- 2 tbsp Soy Sauce\n\n\n#INSTRUCTIONS\n1. Stir all the ingredients evenly, and then stir in the same direction until it becomes slightly sticky. Place in the refrigerator to marinate overnight.\n2. Stir well the marinated ground meat, and then spread it on the baking paper evenly. (Thickness depends on your personal preference)\n3. Sun-drying pork jerky on the balcony or outside the house (only takes about one hour under the strongest sunlight at 12 noon)\n4. Cut the sun-dried pork jerky into small pieces, then turn it over and dry it for another one hour.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
70	Creme Caramel!	**Shoppinglist**   \nCaramel 60 milliliters of Water   \n55 grams of sugar \n\n**Custard pudding**   \n2 large eggs   \n25 grams of sugar   \n15 milliliters of vanilla extract   \n240 milliliters of heavy cream   \n250 milliliters of milk \n\n**Instructions**   \n1. First we make the syrup. Add 55 grams of sugar and 30 milliliters of water to a sauce pan.   \n2. Add 30 milliliters of water and turn of the heat.   \n3. Pour the syrup in the ramekins. Let the syrup cool completely.   \n4. Then we are going to make the custard pudding. Heat up 240 milliliters of heavy cream and 250 milliliters of milk in a sauce pan. When you see a foamy layer on top of the mixture turn of the heat.   \n5. Add 2 large eggs with 25 grams of sugar to a mixing bowl. Mix everything   \n6. Add the warm mixture little by little in the egg/sugar mix bowl.   \n7. Add 15 milliliters of vanilla extract to the mixture.   \n8. Sieve the mixture   \n9. Pour the mixture into the completely cooled ramekins.   \n10. Preheat the oven to 150 degrees celcius.   \n11. Put the ramekins in a tray with hot water and bake them for 40 minutes.   \n12. After 40 minutes let the ramekins cool completely. When they are completely cooled put them in the fridge for 60 minutes.   \n13. When the custard is set use a thin knife to cut around the edges.   \n14. Flip the ramekin on a plate.   \n15. Video Instruction Nolyns Kitchen Creme Caramel on YouTube.	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
71	Kapu[niaczki - Polish Sauerkraut &amp; Mushroom Pasties	These golden-brown pasties taste luscious!\n\nSuper fluffy and sweet bun with a savoury mouthwatering stuffing. By the time you finish the first one, you will be thinking about another one!\n\n\nThis Polish pasty is prepared for special occasions like Christmas and throughout the year as a snack. Different types of dough are used ranging from crunchy to more fluffy.\n\nOn many occasions, puff pastry is used as well for the convenience of preparation. Wild mushrooms are also used as an addition to the filling giving it more depth and richness. Exceptionally good when served with borscht. In some regions of Poland also called ''Paszteciki''\n\nThis recipe makes 10 pasties\n\n**Ingredients for the filling:**\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
72	Chocolate and Peanut Cookies	Video recipe :  [Chocolate and Peanut Cookies](https://youtu.be/hiS5tdNhuD0)\n\n**ingredients**\n\n* 250 g of chocolate \n* 250 g margarine at room temperature  \n* 180 g icing sugar\n*  90 ml oil \n*  1 egg\n*  1 pinch of salt \n*  1 teaspoon lemon zest \n* 550-650 g of flour depends on the type of flour \n* 250g roasted peanuts \n* 15 g baking powder \n\n**Instructions** \n\n*  In a bowl put 250 g of margarine \n*  Add 180 icing sugar\n*  add 1 pinch of salt \n* Add 15 g of baking powder \n*  Add 1 tablespoon of lemon zest \n*  Mix everything until you get a homogeneous cream \n*  Add 90 ml of oil and mix well \n* Add 1 egg and mix \n* Add the flour (little by little)\n*  Divide the dough into 3 balls \n* Cover the dough and refrigerate for 15 minutes \n* Crush 200 g of roasted peanuts and save 50 g whole for later \n* Place a peanut in each ball of dough \n* Bake at 160ºC for 30-40 minutes \n*  In a saucepan over low heat, melt the chocolate with 15 ml of oil \n* Add 200 g of roasted peanuts to chocolate  \n*  Dip the cookies in chocolate and let dry	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
73	Baked Feta Pasta	Hey guys, this is the recipe from tik tok.\n\nIngredients:\n\n1. 2 pints (\\~900g) cherry tomatoes\n2. 6 tbsp olive oil\n3. 8-10 cloves garlic\n4. 1/2 tbsp black pepper, 1/2 tbsp salt, 1/2 tbsp oregano\n5. 8oz (\\~227g) feta cheese)\n6. \\~150g pasta\n7. (optional) 1/2 tbsp chilli flakes, basil, parsley\n\nInstructions: [demo](https://youtu.be/8JDRW6marPk)\n\n1. Preheat oven 400F (204C)\n2. Place cherry tomatoes and chopped garlic in a baking tray\n3. Add olive oil, black peper, salt, oregano, (optional chili flakes) and mix\n4. Add Feta cheese in the center and add a little more olive oil and seasoning on top\n5. Bake in the oven for 25 minutes, then broil for 5 minutes for a total of 30 minutes in the oven\n6. While tomatoes are in the oven cook your pasta.\n7. Take baking tray out of the oven and mash tomato and feta cheese\n8. Mix in your pasta. (optional: add some fresh herbs before serving)\n\nAs always, please enjoy	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
74	How to make: Authentic Pasta alla Amatriciana	 \n\nPasta alla Amatriciana is a classic Italian recipe. Very easy to make but with a unique taste and flavour Pasta alla Amatriciana is something to try. As always if you like the recipe and want to subscribe you are welcome\n\nVideo recipe [HERE](https://youtu.be/hMGCGpchRj8)\n\nIngredients for about 4\n\n* Spaghetti 320 gr\n* Guanciale ( o stretched bacon ) 200 gr\n* tomato sauce 500 gr\n* Pecorino romano\n* Parmigiano ( optional )\n* 1 glass white wine\n\nINSTRUCTION\n\n* cut 200 g of Guanciale into strips ( or stretched bacon if you can't find it )\n* place the guanciale in a frying pan and cook for 4-5 minutes until the fat is transparent and the meat is crispy.\n* Stir frequently, taking care not to burn it.\n* When the fat has melted, add a glass of white wine and let the alcohol evaporate.\n* Now use a kitchen skimmer to remove the pieces of guanciale and pour in 500 g of tomato sauce. Add salt and pepper to taste.\n* Cook for 15 minutes, then add the pieces of cooked guanciale and continue cooking for another 5 minutes.\n* In the meantime, cook 320 gr spaghetti in plenty of salted water (be sure to drain the spaghetti al dente).\n* put the well drained spaghetti in a bowl, add 50 g of grated pecorino romano and mix well.\n* then add the amatriciana sauce and stir again.\n* Serve the spaghetti hot with a generous sprinkling of pecorino romano or Parmigiano.\n\nThat's all! if you have any question feel free to ask !!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
75	Smoked Queso Dip	Smoked Queso\n\nIngredients:\n1 pound ground bison (substitute ground beef, chorizo, or sausage)\n1 or 2 (10 oz) cans fire roasted diced tomatoes &amp; green chilies\n1 large poblano pepper, diced (substitute jalapeno for more spice)\n2 pounds velveeta cheese (or other melty block cheese)\n\nPreparation:\nBrown and drain ground bison, put in the bottom of foil pan.\nDrain the canned tomatoes and chilies and add to the top of the meat.\nDice poblano pepper and add to the mixture.\nCut cheese in to blocks and add to the top of the foil pan.\nRun the smoker at 250°F, we used Texas Smokehouse Post Oak. \nVery versatile, no matter what other dishes you're cooking.\nAfter 1 hour smoked, stir the queso.\nPull the smoked queso after 1 hour and 30 minutes.\n\nTip: add to slow cooker on low for serving long term melted cheesy goodness! Also, adding a little milk to the queso when it starts to seize up will revive it immediately once stirred in. \n\nMore images: https://www.maizeandhoney.com/2021/02/06/smoked-queso/	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
76	Tart with Vanilla Cream and Berries	\nYou will also need approximately 600 g of fresh berries (in my case I used blackberries, raspberries and currants), a dose of gelatine for cakes, and a small dose of apricot jam.\n\n\n* Powdered Sugar: 100 g\n* Whole Eggs: 40 g\n* Egg Yolks: 40 g\n* Vanilla Extract: 2 g\n* Grated Lemon Peel: 2g\n* Salt: 2 g\n\nBasically, it is a variant of the standard pastry cream, with the difference that we leave the seeds and the vanilla bean in the milk at a high temperature (the berry will then be removed before adding the other ingredients).\n\n* Milk: 500 g\n* Caster sugar: 80 g\n* Egg yolks: 100 g (approximately 5 large eggs)\n* Flour: 18 g\n* Cornstarch: 18 g\n* Vanilla beam: 1\n\nPut to boil the milk together with the seeds and the empty beam of vanilla.\n\nThe shell is cooked in two steps: for the first 15 minutes with the weights, for the remaining 10 minutes without the weights. The oven temperature must be 170 ° C. Static oven with closed valve.\n\nOnce cooked, remove the shell from the oven and let it cool before separating it from the mould. \n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
77	Mini Cheeseburger Muffins	Link to the recipe with more info and images: [Mini cheeseburger muffins](https://delightbaking.com/mini-cheeseburger-muffins/)\n\n**Total ingredients needed**\n\n* 415 g All-purpose flour\n* 8 g Salt\n* 8 g White sugar\n* 11 g Yeast  Fresh\n* 270 g Milk  3,5% fat\n* 300 g Ground beef\n* 1x Onion (small)\n* ~80 g Tomato ketchup\n* ~80 g Cheddar cheese\n* ~10 g Canola or sunflower oil\n* 3x Gherkins\n* Salt\n* Pepper\n\n* Let your mini cheeseburger muffins cool in the cupcake cups for 10 minutes\n* Afterwards add some gherkin slices and tomato ketchup on top	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
78	Fried Oyster Po'Boy	RECIPE\n\n* FOR THE OYSTERS\n* 1 Pint Oysters, shucked (about 4 dozen)\n* 3 Large Eggs\n* 2 Tbsp. Cream\n* 1 Tsp. Garlic Powder\n* 1 Tsp. Onion Powder\n* 1 Tsp. Black Pepper\n* 1 Tsp. Creole Seasoning (low salt)\n\n### Instructions\n\n1. Shuck oysters (if they are not already done so.)\n2. Take eggs, cream, garlic powder and onion powder and beat until combined.\n3. Add cornmeal mix, creole seasoning and black pepper and stir well to combine.\n4. Take the oysters and drop into the egg mixture, then coat in the cornmeal mixture.\n5. Fry in peanut oil that is 350°F for about 2 minutes only.\n6. Remove immediately and allow to drain on paper towel.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
79	Clay Pot Rice w/ Chinese Sausage and Cured Pork Belly	Ingredients:\n\n1. 1 cup rice\n2. Chinese cured sausage and pork belly. As much or as little as you like\n3. 1 green onion\n4. 2 cloves of garlic\n5. 1 egg\n\n1. Rinse and soak the rice for 30 minutes.\n2. In the meantime, mince the garlic and finely chop up the green onion. Slice your cured meats thinly.\n3. After the rice is finish soaking, mixed the garlic and the green onion whites with the rice.\n4. Add water to just above the level of the rice (this is going to be less than you need to make rice normally). Place your sliced meat on top.\n5. Cook the pot with lids closed on high for 10-15 minutes depending on your stove. At this point your rice should be done cooking.\n6. Crack an egg on top and cook on medium to medium-low heat for another 10 minutes. This is to allow the egg to cook and the rice to crisp up on the bottom.\n7. After the time is up pour in your sauce (use more or less depending on your preference). Mix. As always, please enjoy :)	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
80	Spicy Buttermilk Fried Chicken Sandwich	\n**\\[RECIPE (4 SANDWICHES)\\]**\n\n**INGREDIENTS:**\n\n**Buttermilk Marinade**\n\n* 4 pieces boneless skinless chicken thighs, pounded to even thickness\n* 1 cup buttermilk\n* 2 tbsp Sriracha, or your favorite hot sauce\n* 1 tsp each salt, pepper, garlic powder\n\n**Flour Mixture**\n\n* 1 cup all-purpose flour\n* 3 tbsp cornstarch\n* 1 tbsp paprika powder\n* 1 tsp each salt, pepper, garlic powder, cayenne powder\n\n**Sriracha Mayo**\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
81	Heart Shaped Strawberry Milk Custard Steamed Buns for Valentine's Day	\n\n**Ingredients:**\n\n\n* 60ml warm strawberry milk\n* 1/2tsp yeast\n* 1tb sugar\n* 1tsp vegetable oil\n* 100g all-purpose flour\n\n**Instructions:**\n\n1. Start by making the strawberry milk custard. Beat two large egg yolks in a bowl, then whisk in 1tb of sugar and 2tb of cornstarch.\n2. Heat 180ml of strawberry milk in a saucepan on medium heat until wisps of steam just start to appear. Gradually whisk in the hot milk to the egg yolks. Start with a small amount, a couple tablespoons worth, and then slowly pour in the rest of the milk while whisking. Take it slowly so as to not scramble the yolks. You can use more milk to make the custard runnier, but a looser custard will be hard to work with.\n3. Pour the custard mixture back into the saucepan on medium heat. Keep whisking the custard until it thickens completely. Nothing will happen at first, and then things will suddenly start to thicken. Lift the saucepan off the heat to stay in control if needed.\n4. Move the custard into a bowl and cover with plastic wrap and let cool. When the custard is cool enough to handle, divide into four and roll each portion in a flat ball. Cover again and let rest in the fridge until the dough is ready.\n5. Make the dough. Add 60ml of warm strawberry milk to a bowl, then add 1/2tsp of yeast, 1tb of sugar, 1tsp of vegetable oil, and 90g of all-purpose flour. Mix until a dough forms, and then knead the dough for about 10min or until smooth. Add the remaining 10g of all-purpose flour if needed. Form into a ball, cover with plastic wrap, and let rest at room temperature for about 2 hours or until doubled in size.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
82	Creamy Basil Pasta	\n**INGREDIENTS** \n\n· 4 Cups of Pasta\n\n· 4 Cups of Broccoli Florets\n\n· 4 Handfuls of Watercress\n\n· 2 Cups of Sun Dried Tomatoes \n\n· 1 Medium Sized Onion \n\n· 1 Big Red Bell Pepper\n\n\n\n**METHOD**\n\n1. Boil Pasta as per instruction on packaging. Reserve a cup of the starchy water, set aside\n\n2. Whilst pasta boils put all the sauce ingredients in a high-speed blender. Blend till smooth, set aside\n\n3. Put Olive oil in skillet wait till hot, add the Onions, Bell Peppers, 1 tsp. of Salt and 2 tsp. of Black Pepper. Cook for about 3 Minutes, till the vegetables soften \n\n4. Add Sun dried Tomatoes and Watercress, Stir till Watercress wilts, about 2 minutes \n\n· If you buy Sun Dried Tomatoes that is stored in oil, dab the oil with a kitchen towel or simply take them out of oil and refrigerate the night before\n\n5. Add Broccoli, Sautee for about 30 seconds\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
83	Boba Milk Tea Tang Yuan	### INGREDIENTS\n\nMilk Tea Lava Custard\n\n* 1 cup whole milk\n* 3 tbsp black tea\n* 1/2 cup granulated sugar\n* 2 egg yolks\n* 1 tbsp coconut oil\n* 2 tbsp cornstarch\n* 1 tsp all purpose flour\n\n\n### INSTRUCTIONS\n\nMilk Tea Lava Custard\n\n1. Pour the milk and sugar into a small s\n3. Allow the tea leaves to steep in the milk for \\~7 minutes \n4. In a small bowl, combine the flour and cornstarch\n5. In another bowl, melt the coconut oil and whisk it together with the egg yolks\n6. Pour the dry ingredients into the whisked egg yolks and mix until combined\n7. Once the tea is done steeping, strain out the leaves and then slowly pour in the warm milk into the egg yolk mixture, 1/4 cup at a time, and whisk together\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
84	How to make rice with 3 flavors and 3 colors	You can find the full recipe here :  [How to make rice with 3 flavors and 3 colors](https://youtu.be/i0kOMnJvSWI)\n\nGREEN RICE\n\n**Ingredients**\n\n* 1 cup of Basmati rice\n* 2 cups of boiling water\n* 1 green pepper -some chives\n* 2 cloves of garlic\n* Parsley\n\n**Instructions**\n\n* In a bowl put parsley, 1 green pepper, 2 cloves of garlic, chives, salt, black pepper\n* Add 1 cup of water\n* Blend very well in a food processor\n* In a saucepan, sauté the chives or 1/2 onion, 2 cloves of garlic and oil\n* Add 1 cup of washed and well drained rice\n* Fry the rice over low heat, without stopping stirring for 3-5 minutes.\n* Add the mixture to the rice and boil 1-2 minutes\n* Add 1 cup of boiling water and stir\n* Cover and boil, without stirring, for 8-10 minutes On low heat\n\nAfter 8-10 minutes, remove the casserole from the heat, stir and let stand 2 or 3 minutes\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
85	How to make Caprese, An Italian Flourless Chocolate Cake - GLUTEN FREE-	\nINGREDIENTS for a springform pan 22 cm diameter\n\n* 50% dark chocolate to be grated 170 g\n* Peeled almonds 85 g\n* hazelnuts 85 g\n* powdered sugar 170 g\n* Softened butter 170 g\n* Potato starch 25 g\n\n**INSTRUCTION**\n\n* Add a pinch of salt and work the mixture until it is well fluffy\n* Transfer the mixture in a mixing bowl\n* Now in the stand mix put 150 gr of egg white and 85 gr of powdered sugar start working the egg whites until they are well whipped\n* Add a third of the beaten egg whites to the egg yolk and butter mixture, then a third of the powdered ingredients mixing gently from the bottom up.\n* Gradually add a third of the egg whites and a third of the powders and continue in this way until you get a uniform mixture.\n* Pour the smooth and creamy mixture into a springform pan ( 22 cm diameter ) already buttered and floured with potato starch. Carefully level the surface and bake in oven at 170° for about 45 minutes .\n* Let the cake cool down then sprinkle it with powdered sugar.you can enjoy the caprese with classic or zabaione custard\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
86	Chocolate bundt cake with coffee glaze	\n**Ingredients**\n\n* 240g (2 cups) all-purpose flour\n* 40g (½ cup) Dutch-process cocoa powder\n* 1 tablespoon baking soda\n* ½ teaspoon sea salt\n* 60g (2 oz) bittersweet chocolate, chopped\n* 150ml (¾ cup) vegetable oil\n* 1 teaspoon vanilla extract\n* 100g (½ cup) granulated sugar\n\n**Directions**\n\n**Cake:**\n\n1. Preheat the oven to 175°C (350°F).\n2. In a medium bowl, sift the flour, cocoa powder, baking soda and salt to remove lumps.\n4. Whisk in oil, vanilla extract, granulated sugar and brown sugar to melted chocolate until smooth, then add egg and mix.\n5. Add half of the flour mix from step #2 to the chocolate mixture and mix, before adding 1/2 cup of coffee and 1/2 cup of buttermilk and whisk until smooth. Add the remaining dry ingredients and mix, then add coffee and buttermilk and whisk until smooth.\n6. With pastry brush or fingers, oil a 12-cup bundt pan with vegetable oil, making sure to get all the crevices and up the middle. Use a paper towel to blot any excess oil. Sprinkle 1 tablespoon of cocoa powder on the pan and standing over a sink, slowly rotate the pan and allow the loose cocoa powder to roll over the pan, up to the edges. Flip the pan over the sink and slap the bottom with the palm of your hand to remove any big patches of cocoa powder.\n7. Pour the batter into the prepared pan and bake in the lower third of the oven for about 40 minutes, or until a toothpick inserted in the centre of the cake comes out with a few moist crumbs attached.\n8. Remove cake from the oven and let the cake cool on a rack for 10 minutes, then place a large plate over the bundt pan, turn it out and let cool completely.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
87	Air Fryer Korean Style Chicken Wings	Haha, not sure if it's a coincidence but I've seen a couple Korean-inspired recipes here. Love to spread the love. These are air fryer chicken wings, so faster than baking and healthier than frying. Recipe below:\n\n### Equipment\n\n* Air fryer\n\n### Ingredients\n\n* 1 lb chicken wings (0.5kg)\n* 1 tsp salt\n* 1 tsp paprika\n* 2 tbsp gochujang\n* 1 tbsp rice vinegar\n\n### Instructions\n\n* Pat chicken wings to dry. Season with salt, garlic powder, paprika, and cover with baking powder. Toss to coat evenly.\n* Air fry for 20 minutes at 400°F/205°C. At the 10 minute mark, use tongs to turn your wings so they are evenly cooked on both sides.\n* Mix gochujang, rice wine, honey, toasted sesame oil in a bowl, use water to thin the sauce out.\n\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
88	I experimented with marite on wings and it turned out awesome.	You can get the original recipe [here](https://braisedanddeglazed.com/marmite-and-chili-baked-chicken-wings/).\n\n### Ingredients\n\n* 500g chicken wings 10 wings\n* 1 tsp marmite\n* 1 tsp chili\n* 2 tsp palm sugar or brown sugar\n* 1 tsp smoked paprika\n* ½ tsp black pepper\n* 2 tbsp peanut oil or any high-smoke point oil (canola, grapeseed, etc.)\n* 1 tsp red wine vinegar\n* ½ tsp sea salt\n\n### Instructions\n\n* Mix all of the ingredients thoroughly in a bowl. Let sit for 10 minutes. Alternatively, you can marinate these overnight.\n* Set the oven on high convection to 220°C/ 425°F\n* Line the chicken wings on a baking tray making sure not to overcrowd the tray.\n* Roast the chicken wings for 20 minutes. Then turn over the chicken wings and finish on the other side for another 10 minutes.\n* Let the chicken wings rest for 5 minutes before eating. Enjoy!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
89	Korean Tofu Kimchi with Pork	Dubu (ie. tofu) kimchi is a popular anju in Korea, which means it pairs nicely with alcoholic drinks such as soju or makgeolli. This dish consists of soft tofu and well-fermented sour kimchi that is stir-fried with pork. If you'd prefer to leave out the pork, that is fine too! For a more filling meal, you can serve dubu kimchi over rice.\n\n**3 minute tutorial:** [https://youtu.be/qM4lL5bWwQQ](https://youtu.be/qM4lL5bWwQQ)\n\nINGREDIENTS For 2-3 servings:\n\n* 1 onion, sliced\n* 3 scallions, cut diagonally (finely chop the green part of 1 scallion for garnish)\n* 1 block of tofu, medium slices (1/2 inch thick)\n* 0.75 lb sliced pork butt\n* 1 tbsp brown or white sugar\n\n\nTIMESTAMPS &amp; INSTRUCTIONS\n\n1. On Medium heat, add 2 tsp oil\n2. Stir-fry the pork until its half-way cooked\n3. Add the brown sugar and stir for 5 minutes\n4. Add the kimchi, minced garlic, and red chili pepper\n5. Cook for 10 minutes\n6. Add the onions, 1/2 cup of water, soy sauce, scallions, sesame seeds, and sesame oil, and stir well!\n7. In a pot, place the tofu in enough water to submerge them\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
90	Korean Shrimp Burger	\n**\\[RECIPE (2 SERVINGS)\\]**\n\n**Ingredients:**\n\n* 16 (180g) large shrimp, half finely minced, and half diced\n* 2 tbsp onion, chopped\n* 3 tbsp all-purpose flour\n* 1 tbsp water, add more if needed\n* 1/4 cup all-purpose flour, to coat the patty\n* 1 large egg, beaten\n* 1/2 cup panko bread crumbs\n* light pinch of salt and pepper\n\n**Directions:**\n\n**Shrimp Patty**\n\n1. Prepare three separate trays with flour, egg, and panko bread crumbs.\n2. In a small mixing bowl, add shrimp (half minced and half diced), onion, a small pinch of salt and pepper, and mix together. \n3. Carefully coat each patty with flour, egg, and bread crumbs in order, making sure each side is evenly coated, shaking off any excess. Set aside for 10 minutes before frying.or until golden brown. Remove from oil, and place the mozzarella cheese slice on top to melt in the heat.\n	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
91	Mushroom Risotto using Oyster Mushrooms, Dried Chanterelles and Button Mushrooms! (OC)	I'm not sure if it's traditional to serve salads with risotto, but I added a refreshing tomato, shallots and lime-zest salad to cut through the richness of the risotto =!\n\n**Ingredients for the Risotto**\n\n* Two shallots\n* 400 grams risotto rice\n* 200 ml white wine\n* 1.2 l mushroom/vegetable broth\n* salt/pepper to taste\n* 200-400 grams mushrooms (have some fun and the quantity is to your liking)\n\n**Directions for the Risotto**\n\nThere's not much to the mushroom risotto; I started by frying some shallots in a couple of tablespoons olive oil. After a minute or two I'll add 400 grams of risotto rice, and after another minute I'll cook the alcohol off from 200 ml of white wine. You follow it up by letting the risotto rice soak through 1.2 L of mushroom broth.\n\nIn a separate pan, you cook down the mushrooms, reducing the moisture. Because I was also using some dried mushrooms, I added those into the risotto, last second, and cooked them for 3 minutes. When you're happy with your mushrooms, season to taste, you add them back to the risotto, and you're ready to serve. At this step, you can also add some parmesan, but my version was vegan.\n\nEnjoy!	["https://plus.unsplash.com/premium_photo-1673439307…ufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"]	t	2023-06-14 07:56:29.826492
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (id, name, description, photos, rating, price, review_count, popularity, address, city, zip, state, country, latitude, longitude, is_visible, transactions, hours, phone, tags, photo, yelp_id, created_at) FROM stdin;
1	Bottega Louie	Italian	\N	4	$$	18264	\N	700 S Grand Ave	Los Angeles	90017	CA	US	34.047056	-118.256544	t	["delivery"]	\N	+12138021470	\N	https://s3-media1.fl.yelpcdn.com/bphoto/rAImnKvUNcNY8i6qEDWrZA/o.jpg	TkFEKhsCixPWlShULKvMdQ	2023-06-14 08:38:36.26316
2	Bestia	Italian	\N	4.5	$$$	7376	\N	2121 E 7th Pl	Los Angeles	90021	CA	US	34.03402	-118.22919	t	["delivery"]	\N	+12135145724	\N	https://s3-media2.fl.yelpcdn.com/bphoto/qourX-TmOyNBEQZxDqAwUA/o.jpg	fEY0zHaDMfIW3-N__joDKQ	2023-06-14 08:38:36.26316
3	L'Antica Pizzeria Da Michele	Italian	\N	4.5	$$$	1839	\N	1534 N Mccadden Pl	Los Angeles	90028	CA	US	34.09906083	-118.3373107	t	["pickup"]	\N	+13233662408	\N	https://s3-media2.fl.yelpcdn.com/bphoto/SCuuHjFSwNpuYxpncVDs9w/o.jpg	88kri8FhXy8b3DQ_QjSMmQ	2023-06-14 08:38:36.26316
4	Pasta Sisters	Italian	\N	4.5	$$	1952	\N	3343 W Pico Blvd	Los Angeles	90019	CA	US	34.0476	-118.317234	t	["pickup"]	\N	+13238705271	\N	https://s3-media2.fl.yelpcdn.com/bphoto/EPQ4QG9mbRqvon1ZO5u16Q/o.jpg	AIhWsp8yNfKZfaX9d9Yajg	2023-06-14 08:38:36.26316
5	DeSano Pizza Bakery	Italian	\N	4.5	$$	1668	\N	4959 Santa Monica Blvd	Los Angeles	90029	CA	US	34.09100997	-118.2977629	t	["pickup"]	\N	+13239137000	\N	https://s3-media2.fl.yelpcdn.com/bphoto/uPUePX2lRk6fkAObl37X9w/o.jpg	fD4ntpbf92ufSHn5tSmSxA	2023-06-14 08:38:36.26316
6	Bacari W 3rd	Italian	\N	4.5	$$	1017	\N	8030 3/4 W 3rd St	Los Angeles	90048	CA	US	34.07172	-118.36485	t	["pickup"]	\N	+12139332327	\N	https://s3-media1.fl.yelpcdn.com/bphoto/M_LLLThdYRdoW_mRAk5uNw/o.jpg	y2eWXL2qbTW8tXyrEsfEqQ	2023-06-14 08:38:36.26316
7	Osteria La Buca	Italian	\N	4	$$$	2219	\N	5210 Melrose Ave	Los Angeles	90038	CA	US	34.08333668	-118.3139372	t	["pickup"]	\N	+13234621900	\N	https://s3-media3.fl.yelpcdn.com/bphoto/xeVaSq6kS6WuT3OFj7yPJg/o.jpg	GKQApReu8U9hip4A2ApJ_A	2023-06-14 08:38:36.26316
8	Concerto	Italian	\N	4	$$	1394	\N	610 S Serrano Ave	Los Angeles	90005	CA	US	34.063071	-118.306414	t	["delivery"]	\N	+12137380909	\N	https://s3-media1.fl.yelpcdn.com/bphoto/W0PtAkmnwrk0wf7bcwOoDA/o.jpg	IMoMSsC3oDqcNZCQXyo8iQ	2023-06-14 08:38:36.26316
9	Maccheroni Republic	Italian	\N	4.5	$$	3806	\N	332 S Broadway	Los Angeles	90013	CA	US	34.05002828	-118.248528	t	["delivery"]	\N	+12133469725	\N	https://s3-media4.fl.yelpcdn.com/bphoto/I-4SnHvaWothASzVaMhVYw/o.jpg	gd6PYDx-leOM97a3MWoO1g	2023-06-14 08:38:36.26316
10	Osteria Mozza	Italian	\N	4	$$$$	3207	\N	6602 Melrose Ave	Los Angeles	90038	CA	US	34.08319	-118.33881	t	["delivery"]	\N	+13232970100	\N	https://s3-media4.fl.yelpcdn.com/bphoto/TePk-GCTvpCaztilF5eIPg/o.jpg	YoQn8MtOimQbqi839TmeZw	2023-06-14 08:38:36.26316
11	Met Him At A Bar	Italian	\N	4.5	$$	606	\N	801 S La Brea	Los Angeles	90036	CA	US	34.060415	-118.345018	t	["pickup"]	\N	+13238523321	\N	https://s3-media3.fl.yelpcdn.com/bphoto/hKkhb5t7RN8oRUIkVbrooA/o.jpg	HuQtriV_ApipXfM8xax33w	2023-06-14 08:38:36.26316
12	Angelini Osteria	Italian	\N	4	$$$	2112	\N	7313 Beverly Blvd	Los Angeles	90036	CA	US	34.07642	-118.34909	t	["delivery"]	\N	+13232970070	\N	https://s3-media2.fl.yelpcdn.com/bphoto/1Mh9UEn1H74pTCsfD5h7bg/o.jpg	P9Dt_kkU5BTe1v0tJ4KFNw	2023-06-14 08:38:36.26316
13	Osteria Mamma	Italian	\N	4	$$	1899	\N	5732 Melrose Ave	Los Angeles	90038	CA	US	34.08335868	-118.3247249	t	["delivery"]	\N	+13232847060	\N	https://s3-media2.fl.yelpcdn.com/bphoto/BCT1NUTlwCan0KTW1JmRIw/o.jpg	rr-hXB0ZqXLzUP97yftp0g	2023-06-14 08:38:36.26316
14	DRAGO Centro	Italian	\N	4	$$$	1651	\N	525 S Flower St	Los Angeles	90071	CA	US	34.0514	-118.257504	t	["delivery"]	\N	+12132288998	\N	https://s3-media3.fl.yelpcdn.com/bphoto/ixTzcjnVmLDcsRd58gqx_g/o.jpg	p78nnAZrr2JxVNqggm0JSQ	2023-06-14 08:38:36.26316
15	The Factory Kitchen	Italian	\N	4	$$$	1524	\N	1300 Factory Pl	Los Angeles	90013	CA	US	34.038867	-118.23602	t	["pickup"]	\N	+12139966000	\N	https://s3-media3.fl.yelpcdn.com/bphoto/ltWypC3lOuC0bzm_R0hm4A/o.jpg	cK9wMWnQEW9MdYjc-YWueg	2023-06-14 08:38:36.26316
16	Rossoblu	Italian	\N	4	$$$	811	\N	1124 San Julian St	Los Angeles	90015	CA	US	34.034918	-118.253338	t	["delivery"]	\N	+12137491099	\N	https://s3-media4.fl.yelpcdn.com/bphoto/p6WDqs5IKF_VoMTp4Sp9gQ/o.jpg	YYKK5pDAWQimcHzOz-7nug	2023-06-14 08:38:36.26316
17	Bacari W. Adams	Italian	\N	4	$$	1744	\N	2308 S Union Ave	Los Angeles	90007	CA	US	34.03447	-118.28341	t	["pickup"]	\N	+12134591899	\N	https://s3-media3.fl.yelpcdn.com/bphoto/UeTHi6rTg2tIP8h-NeZiKA/o.jpg	8polKN4I6fJx1t8pPxogVw	2023-06-14 08:38:36.26316
18	Mother Wolf	Italian	\N	4	$$$$	530	\N	1545 Wilcox Ave	Los Angeles	90028	CA	US	34.09932	-118.33115	t	\N	\N	+13234106060	\N	https://s3-media2.fl.yelpcdn.com/bphoto/1k4_YK7OrFgHcaMVuaAL3g/o.jpg	V_t4QBPg-eC9-rpD1TRYQg	2023-06-14 08:38:36.26316
19	Jon & Vinny's Fairfax	Italian	\N	4	$$	2362	\N	412 N Fairfax Ave	Los Angeles	90036	CA	US	34.0786401	-118.3613451	t	["delivery"]	\N	+13233343369	\N	https://s3-media3.fl.yelpcdn.com/bphoto/OQwbl36bvmwL4ph2glu1dw/o.jpg	sPw1o5OYWE5C2JtbTXp5wg	2023-06-14 08:38:36.26316
20	Cento	Italian	\N	4.5	$$	565	\N	4921 W Adams Blvd	Los Angeles	90016	CA	US	34.0327954	-118.3477496	t	["delivery"]	\N	+13239980404	\N	https://s3-media4.fl.yelpcdn.com/bphoto/oB3A5Y1vr6ZajHEcYXj5vw/o.jpg	mogBbg16id_H0pw_YQ3YbA	2023-06-14 08:38:36.26316
21	La Pergoletta	Italian	\N	4.5	$$	1276	\N	1802 Hillhurst Ave	Los Angeles	90027	CA	US	34.1037812	-118.2872479	t	["pickup"]	\N	+13236648259	\N	https://s3-media3.fl.yelpcdn.com/bphoto/G1XjeBOpUByZsPHFFiNFgQ/o.jpg	-KqNRM-drDM7Nu9i9xEnfA	2023-06-14 08:38:36.26316
22	Supremo	Italian	\N	4.5	$$	337	\N	901 S La Brea Ave	Los Angeles	90036	CA	US	34.05867	-118.34578	t	["pickup"]	\N	+13238523192	\N	https://s3-media2.fl.yelpcdn.com/bphoto/AC6E0vKB18sDw11ZTHAjpg/o.jpg	RarITW4zBvhqKAK8FVOFCQ	2023-06-14 08:38:36.26316
23	Della Terra Restaurant	Italian	\N	4	$$	852	\N	7675 Beverly Blvd	Los Angeles	90036	CA	US	34.0762749	-118.3571066	t	["pickup"]	\N	+13239337675	\N	https://s3-media1.fl.yelpcdn.com/bphoto/Np31-r1QgAHxf-dj-LyjbA/o.jpg	YTTCdnu8457jbdEbm_PIig	2023-06-14 08:38:36.26316
24	Marino Restaurant	Italian	\N	4.5	$$$	468	\N	6001 Melrose Ave	Los Angeles	90038	CA	US	34.083621	-118.331184	t	["pickup"]	\N	+13234668812	\N	https://s3-media1.fl.yelpcdn.com/bphoto/xXyX0W7ug1_ERWPd5oJSCA/o.jpg	QEGYtRXGlpuco8jE7u0tGw	2023-06-14 08:38:36.26316
25	Pizzeria Sei	Italian	\N	4.5	$$	377	\N	8781 W Pico Blvd	Los Angeles	90035	CA	US	34.0548249	-118.3832633	t	["pickup"]	\N	+14242799800	\N	https://s3-media2.fl.yelpcdn.com/bphoto/I9CYAMeeAIEaSCN4OmUPTA/o.jpg	RmibDYcG1lVw4K69fqTopg	2023-06-14 08:38:36.26316
26	Rao's Hollywood	Italian	\N	4.5	$$$	657	\N	1006 Seward St	Los Angeles	90038	CA	US	34.0891889	-118.3329546	t	["pickup"]	\N	+13239627267	\N	https://s3-media2.fl.yelpcdn.com/bphoto/7k0-Vq8ZMuntrB_1fECgkw/o.jpg	7e9oi3zq_6pP_LU9YPEXLg	2023-06-14 08:38:36.26316
27	Sparrow Italia	Italian	\N	4	$$$	462	\N	939 S Figueroa St.	Los Angeles	90015	CA	US	34.04561	-118.26422	t	\N	\N	+12136603032	\N	https://s3-media4.fl.yelpcdn.com/bphoto/vSMW5oQzcczEeBHlS93IgQ/o.jpg	l9CyWFbCaU6Wk6b8Tc4i8Q	2023-06-14 08:38:36.26316
28	Spartina	Italian	\N	4	$$$	668	\N	7505 Melrose Ave	Los Angeles	90046	CA	US	34.08387493	-118.3535239	t	["pickup"]	\N	+13237821023	\N	https://s3-media2.fl.yelpcdn.com/bphoto/rLjWt8-ZcsMBwlpKUHTH_w/o.jpg	zLEV5J2HmKHocbPZONGJAA	2023-06-14 08:38:36.26316
29	Chi Spacca	Italian	\N	4	$$$$	658	\N	6610 Melrose Ave	Los Angeles	90038	CA	US	34.08319	-118.33908	t	["pickup"]	\N	+13232971133	\N	https://s3-media3.fl.yelpcdn.com/bphoto/MfcffFKVOg4ndNHDrqnpaQ/o.jpg	7sZnRtSBZcrScdtE-gWyPw	2023-06-14 08:38:36.26316
30	Culina Ristorante + Caffè	Italian	\N	4	$$$	581	\N	300 S Doheny Dr	Los Angeles	90048	CA	US	34.072957	-118.389138	t	["delivery"]	\N	+13108604000	\N	https://s3-media2.fl.yelpcdn.com/bphoto/mCGXldqqDd8DiNPiQEZ-Dw/o.jpg	t7v3kC8hNFHiNoxOQq-W4g	2023-06-14 08:38:36.26316
31	Colori Kitchen	Italian	\N	4	$$	1837	\N	2019 Venice Blvd	Los Angeles	90006	CA	US	34.043871	-118.301036	t	["pickup"]	\N	+12136225950	\N	https://s3-media2.fl.yelpcdn.com/bphoto/f46Be7JnzI2Lx8J3JIBHEg/o.jpg	Kz8ZETLCLPNzzs9Tb4u1SQ	2023-06-14 08:38:36.26316
32	Uovo - Mid-Wilshire	Italian	\N	4.5	$$	352	\N	6245 Wilshire Blvd	Los Angeles	90048	CA	US	34.06372	-118.36446	t	\N	\N	+13236426386	\N	https://s3-media2.fl.yelpcdn.com/bphoto/cYSNglJbn0F8rQCvyhyHrQ/o.jpg	OjUQ0wmRdctqjfz-lErGBQ	2023-06-14 08:38:36.26316
33	Andre's Italian Restaurant	Italian	\N	4	$$	1355	\N	1864 W Washington Blvd	Los Angeles	90007	CA	US	34.0396817	-118.2993893	t	["pickup"]	\N	+13239351246	\N	https://s3-media3.fl.yelpcdn.com/bphoto/d40d_0b3HkZm3G1Ill7UMw/o.jpg	-CW_jNF0-x1RAhlGjX3JUg	2023-06-14 08:38:36.26316
34	OSTE	Italian	\N	4.5	\N	602	\N	8142 W Third St	West Hollywood	90048	CA	US	34.07211	-118.367363	t	["pickup"]	\N	+13234132372	\N	https://s3-media2.fl.yelpcdn.com/bphoto/Wf9TrpRHdJI5tqIodCIO-g/o.jpg	3FlrvSaW-TSwkQDsCpKYEg	2023-06-14 08:38:36.26316
35	Spaccio Salumeria by Truffle Brothers	Italian	\N	5	$$	126	\N	4073 W Washington Blvd	Los Angeles	90018	CA	US	34.04024	-118.32797	t	["pickup"]	\N	+13237950152	\N	https://s3-media3.fl.yelpcdn.com/bphoto/dy9DaGhJ7MrrIbWYscvWgA/o.jpg	jpMKMKAo5SwqSV1N1wh9Ww	2023-06-14 08:38:36.26316
36	Michelangelo Ristorante	Italian	\N	4	$$	933	\N	2742 Rowena Ave	Los Angeles	90039	CA	US	34.10698292	-118.2636239	t	["pickup"]	\N	+13236604843	\N	https://s3-media2.fl.yelpcdn.com/bphoto/f5TgJ1oJok6AlE1XjcMapA/o.jpg	WylKsZv1qKCDqrHd-joiOA	2023-06-14 08:38:36.26316
37	San Antonio Winery	Italian	\N	4	$$	1638	\N	737 Lamar St	Los Angeles	90031	CA	US	34.0636861	-118.2238476	t	["pickup"]	\N	+13232231401	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ZTtlpKfQJGiTPxj0DrUSdA/o.jpg	HlKxlisBOQ80uO6vcetlBA	2023-06-14 08:38:36.26316
38	Locanda Veneta	Italian	\N	4.5	$$$	554	\N	8638 W 3rd St	Los Angeles	90048	CA	US	34.07339	-118.3809	t	["pickup"]	\N	+13102741893	\N	https://s3-media3.fl.yelpcdn.com/bphoto/Lwx55Sv7mpDg_1sdSSg2Vw/o.jpg	9CVqDuk5475QzAEunj_7lA	2023-06-14 08:38:36.26316
39	Grandmaster Recorders	Italian	\N	4	\N	244	\N	1518 N Cahuenga Blvd	Los Angeles	90028	CA	US	34.09861755	-118.3291245	t	\N	\N	+13239637800	\N	https://s3-media3.fl.yelpcdn.com/bphoto/e7oJSdBw_tq1pnWefiykSg/o.jpg	JqAjeYMIRTkMpsvsZpqscw	2023-06-14 08:38:36.26316
40	Pace	Italian	\N	4	$$$	1205	\N	2100 Laurel Canyon Blvd	Los Angeles	90046	CA	US	34.10906	-118.3697	t	["pickup"]	\N	+13236548583	\N	https://s3-media2.fl.yelpcdn.com/bphoto/MrLOZxFYbR1NZ7IrJhfLow/o.jpg	LlaXbuPQBsRXjZFEx5Wkjw	2023-06-14 08:38:36.26316
41	Palermo Italian Restaurant	Italian	\N	4	$$	1738	\N	1858 N Vermont Ave	Los Angeles	90027	CA	US	34.10481	-118.291447	t	["pickup"]	\N	+13236631430	\N	https://s3-media2.fl.yelpcdn.com/bphoto/m1xgemC36RST9oQPS7hrvA/o.jpg	gAb-NtuNbNG8p2dqUMQGjw	2023-06-14 08:38:36.26316
42	Uovo - Studio City	Italian	\N	4.5	\N	391	\N	12833 Ventura Blvd	Los Angeles	91604	CA	US	34.14538016	-118.4127482	t	\N	\N	+17472122690	\N	https://s3-media4.fl.yelpcdn.com/bphoto/Lhf_puUmWuOCSnVoIYlHLg/o.jpg	egFoQz8MfqxtabJN1rdIYQ	2023-06-14 08:38:36.26316
43	Bottega Louie - WEHO	Italian	\N	4	$$$	648	\N	8936 Santa Monica Blvd	Los Angeles	90069	CA	US	34.083913	-118.384953	t	\N	\N	+12138021470	\N	https://s3-media2.fl.yelpcdn.com/bphoto/slb6cR2__1dc5ZR3QtjsWw/o.jpg	g7bvMWpWSNxSoq8WxfEcZQ	2023-06-14 08:38:36.26316
44	Frankie's	Italian	\N	4	$$	498	\N	7228 Melrose Ave	Los Angeles	90046	CA	US	34.08323	-118.34724	t	["pickup"]	\N	+13239372801	\N	https://s3-media3.fl.yelpcdn.com/bphoto/R1HNCojVQXO7_XazN7vzYQ/o.jpg	bSfdLm1ke0oFCUK7hiAQ_g	2023-06-14 08:38:36.26316
45	Antico Nuovo	Italian	\N	4	$$$	192	\N	4653 Beverly Blvd	Los Angeles	90004	CA	US	34.07657	-118.31101	t	["delivery"]	\N	+13235103093	\N	https://s3-media2.fl.yelpcdn.com/bphoto/X6nfdJMUWblund0cbBwr0A/o.jpg	UTBAwLDlZVFNHz44e0DLRg	2023-06-14 08:38:36.26316
46	Brera Ristorante	Italian	\N	4	$$$	792	\N	1331 E 6th St	Los Angeles	90021	CA	US	34.03847976	-118.2347514	t	["delivery"]	\N	+12135538006	\N	https://s3-media1.fl.yelpcdn.com/bphoto/n265lYyayXzqXbhPx1S_1g/o.jpg	aUSK0oQR4ey0rFoDfCXaPw	2023-06-14 08:38:36.26316
47	One More Kitchen	Italian	\N	4	$$	136	\N	300 S Mariposa Ave	Los Angeles	90020	CA	US	34.068823	-118.298876	t	["pickup"]	\N	+12133831313	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ITcbnM8KLzLzSq9GSA1RdA/o.jpg	yCMfb65Srl8NucvVEhubYA	2023-06-14 08:38:36.26316
48	Wood	Italian	\N	4	$$$	1046	\N	2861 Sunset Blvd	Los Angeles	90026	CA	US	34.08292	-118.27289	t	["pickup"]	\N	+13236679940	\N	https://s3-media4.fl.yelpcdn.com/bphoto/3m2BSYYss3odo0nwu8RGJw/o.jpg	F2W1R7yIvSOqD1xH_F1cZA	2023-06-14 08:38:36.26316
49	Tuscan Son	Italian	\N	4.5	$$	460	\N	10700 Santa Monica Blvd	Los Angeles	90025	CA	US	34.051453	-118.432191	t	["pickup"]	\N	+14245353096	\N	https://s3-media3.fl.yelpcdn.com/bphoto/deH1sv-i4N5z8iXwtu-QtQ/o.jpg	mmFT0RqB9PDv8z9TVv9qWA	2023-06-14 08:38:36.26316
50	Proper Pizza and Pasta	Italian	\N	4.5	$$	256	\N	1011 S Alvarado St	Los Angeles	90006	CA	US	34.051521	-118.280395	t	["pickup"]	\N	+12135683395	\N	https://s3-media2.fl.yelpcdn.com/bphoto/M5PXKByNrYyCSM_FppTFkw/o.jpg	F6hXBYy7dx9qN_di10qB0w	2023-06-14 08:38:36.26316
51	Pine & Crane	Chinese	\N	4.5	$$	2892	\N	1521 Griffith Park Blvd	Los Angeles	90026	CA	US	34.09053959	-118.2771289	t	["delivery"]	\N	+13236681128	\N	https://s3-media3.fl.yelpcdn.com/bphoto/T4Je0aW421FLWVaRrfRGtA/o.jpg	ohosmz6FXVAeoW5nUkYwng	2023-06-14 08:38:36.26316
52	Bao Dim Sum House	Chinese	\N	4	$$	3478	\N	8256 Beverly Blvd	Los Angeles	90048	CA	US	34.07577	-118.36982	t	["pickup"]	\N	+13236556556	\N	https://s3-media4.fl.yelpcdn.com/bphoto/Su6hAn4L13LnK_1aZ-dDqQ/o.jpg	kdTFcDSl9vAR-btEm1Q2uw	2023-06-14 08:38:36.26316
53	Paik's Noodle: Hong Kong Ban Jum 0410	Chinese	\N	4.5	$$	790	\N	3470 W 6th St	Los Angeles	90020	CA	US	34.06279582	-118.2977393	t	\N	\N	+12133890410	\N	https://s3-media1.fl.yelpcdn.com/bphoto/SblfBrbr4OjqMP8o30XAYg/o.jpg	WWQsHGIFUkNQF6Uaj4vXCw	2023-06-14 08:38:36.26316
54	ixlb DimSum Eats	Chinese	\N	4.5	$$	919	\N	5900 Sunset Blvd	Los Angeles	90028	CA	US	34.09779	-118.3183	t	["pickup"]	\N	+13238484766	\N	https://s3-media2.fl.yelpcdn.com/bphoto/lw0EibPclFEMYNzAi4dG3w/o.jpg	6b1Kud4nDwsqw1kILxI9ZQ	2023-06-14 08:38:36.26316
55	Yang Chow	Chinese	\N	4	$$	3162	\N	819 N Broadway	Los Angeles	90012	CA	US	34.06301	-118.2384	t	["delivery"]	\N	+12136250811	\N	https://s3-media2.fl.yelpcdn.com/bphoto/KngCcYjnwBADRLaOFW4-5g/o.jpg	ZlQo_ArRw-nnHcrcnYPbiA	2023-06-14 08:38:36.26316
56	Zzamong	Chinese	\N	4	$$	1361	\N	4255 W 3rd St	Los Angeles	90004	CA	US	34.069295	-118.307192	t	["pickup"]	\N	+12137392747	\N	https://s3-media2.fl.yelpcdn.com/bphoto/6AUVIwPCv8wCZ9FYeCfocw/o.jpg	gWM5n5Tyo5h74t-_lp1WUA	2023-06-14 08:38:36.26316
57	COD Restaurant	Chinese	\N	4	$$$	932	\N	8408 W 3rd St	Los Angeles	90048	CA	US	34.0728	-118.37363	t	["pickup"]	\N	+13236589188	\N	https://s3-media2.fl.yelpcdn.com/bphoto/csrT70s2M_0Bnwxrr831tg/o.jpg	8TUWLXWgswfRfMBymL0WRg	2023-06-14 08:38:36.26316
58	Fei Xiang Gong	Chinese	\N	4.5	$$	105	\N	356 S Western Ave	Los Angeles	90020	CA	US	34.06737	-118.30892	t	["pickup"]	\N	+12133185588	\N	https://s3-media4.fl.yelpcdn.com/bphoto/xETE8FEDB3DRQVpwKuLbGw/o.jpg	0stUvaDK5l0bW7tGb7_hgQ	2023-06-14 08:38:36.26316
59	Little Fatty	Chinese	\N	4	$$	1063	\N	3809 - 3813 Grandview Blvd	Los Angeles	90066	CA	US	34.00441	-118.43106	t	["pickup"]	\N	+13105747610	\N	https://s3-media3.fl.yelpcdn.com/bphoto/IxGlewFgXkbFcixQs-5Smw/o.jpg	0jOt0ODWCp8fJzzOM4PgqA	2023-06-14 08:38:36.26316
60	Feng Mao Lamb Kebab - Olympic	Chinese	\N	4.5	$$	630	\N	3901 W Olympic Blvd	Los Angeles	90019	CA	US	34.053617	-118.319659	t	["pickup"]	\N	+13239351099	\N	https://s3-media4.fl.yelpcdn.com/bphoto/IztJ6SgvOsH0grlnaHGClQ/o.jpg	p1O9sw9QdnKn1cV2FEmmhw	2023-06-14 08:38:36.26316
61	Woon	Chinese	\N	4.5	$$	333	\N	2920 W Temple St	Los Angeles	90026	CA	US	34.0741838	-118.2793993	t	["delivery"]	\N	\N	\N	https://s3-media2.fl.yelpcdn.com/bphoto/wmUOOHUilwOmN_TczNnwjg/o.jpg	sgqhqcRGuioPSNCVKA-PZg	2023-06-14 08:38:36.26316
62	Tang Huo Kung Fu Spicy Hot Pot	Chinese	\N	4.5	$$	154	\N	3450 W 6th St	Los Angeles	90020	CA	US	34.06322097	-118.297207	t	["pickup"]	\N	+12136747422	\N	https://s3-media3.fl.yelpcdn.com/bphoto/Dl5EtqmMk4uyUOzUnJ5yvg/o.jpg	mu-sqebqz9DEQRTNP3vKLg	2023-06-14 08:38:36.26316
63	Hui Tou Xiang	Chinese	\N	4.5	$$	234	\N	1643 N Cahuenga Blvd	Los Angeles	90028	CA	US	34.101	-118.32968	t	["pickup"]	\N	+13236457272	\N	https://s3-media2.fl.yelpcdn.com/bphoto/2RJnVsOIxH0_wzlN84oiTw/o.jpg	eMCp5br4J_4at3jIX2ljrg	2023-06-14 08:38:36.26316
64	The Ppong	Chinese	\N	4.5	$$	237	\N	4003 Wilshire Blvd	Los Angeles	90010	CA	US	34.062044	-118.3146891	t	["pickup"]	\N	+12135683953	\N	https://s3-media3.fl.yelpcdn.com/bphoto/Li5i5N_Y7VwLTsJvLA2pKw/o.jpg	AWQELVqEeeCbstdp8PUVYg	2023-06-14 08:38:36.26316
65	Odumak	Chinese	\N	4	$$	123	\N	338 S Western Ave	Los Angeles	90020	CA	US	34.067837	-118.308804	t	["pickup"]	\N	+12136286996	\N	https://s3-media1.fl.yelpcdn.com/bphoto/hKaezVO6_0F50RXmfH7WBQ/o.jpg	kDVlUSFSUR8ZYIOJi4bDQQ	2023-06-14 08:38:36.26316
66	Hoys Wok Chinese Food	Chinese	\N	5	$$	128	\N	8520 W 3rd St	Los Angeles	90048	CA	US	34.07327885	-118.3769215	t	["pickup"]	\N	+13107347373	\N	https://s3-media1.fl.yelpcdn.com/bphoto/7anZW3ZgXaMY3gYsXIv71Q/o.jpg	OdwPQ98elBOVUPjWwZYVMQ	2023-06-14 08:38:36.26316
67	Sea Dragon Chinese Restaurant	Chinese	\N	4	$$	489	\N	101 S Vermont Ave	Los Angeles	90004	CA	US	34.07255309	-118.2921566	t	["delivery"]	\N	+12133829993	\N	https://s3-media3.fl.yelpcdn.com/bphoto/rRVmuKlmCPHjHI2czWrvyA/o.jpg	KgPICfpkOeM_o4MdqUGDwA	2023-06-14 08:38:36.26316
68	Daybird	Chinese	\N	4.5	$$	292	\N	240 N Virgil Ave	Los Angeles	90004	CA	US	34.07596282	-118.286511	t	\N	\N	\N	\N	https://s3-media3.fl.yelpcdn.com/bphoto/AZgmkoJbQebdTfYJtkb3aA/o.jpg	vqIms0ABjR5rvbp_d9eDqQ	2023-06-14 08:38:36.26316
69	MIAN | 滋味小面	Chinese	\N	4	$$	358	\N	5263 W Adams Blvd	Los Angeles	90016	CA	US	34.03266	-118.35751	t	\N	\N	+13233326176	\N	https://s3-media2.fl.yelpcdn.com/bphoto/IDZ9VESPQLXOStFz_YZrqw/o.jpg	JxSNu4tMyiRe6WK7YW9GAg	2023-06-14 08:38:36.26316
70	Feng Mao Lamb Kebab - Western	Chinese	\N	4	$$	526	\N	414 S Western Ave	Los Angeles	90020	CA	US	34.06662622	-118.3089679	t	["pickup"]	\N	+12133889299	\N	https://s3-media1.fl.yelpcdn.com/bphoto/AJRCsKOJFrmOwQcOd23b6Q/o.jpg	q8hexOMqB9s3-ryNoum_KA	2023-06-14 08:38:36.26316
71	Fortune House Chinese Cuisine	Chinese	\N	4	$$	423	\N	6031 San Vicente Blvd	Los Angeles	90036	CA	US	34.058352	-118.362566	t	["restaurant_reservation"]	\N	+13239366133	\N	https://s3-media4.fl.yelpcdn.com/bphoto/E2nU_Ufw3dneCCW59tRkFQ/o.jpg	e8zRlJtK-pmau8hDgOwllQ	2023-06-14 08:38:36.26316
72	Iron Teapot Dim Sum & Bar	Chinese	\N	4	$$$	662	\N	10306 Venice Blvd	Los Angeles	90034	CA	US	34.02070314	-118.4029162	t	["restaurant_reservation"]	\N	+13107361803	\N	https://s3-media3.fl.yelpcdn.com/bphoto/f88G-jxSH49pPHHmcpfqPw/o.jpg	ubOBDUCB_WJNZaY_iutZ-Q	2023-06-14 08:38:36.26316
73	Needle	Chinese	\N	4.5	$$	101	\N	3827 W Sunset Blvd	Los Angeles	90026	CA	US	34.09191266	-118.2793567	t	\N	\N	\N	\N	https://s3-media1.fl.yelpcdn.com/bphoto/5CkTsmZRr86Dz5a5verH3A/o.jpg	-bKSg3-kXFSFUA7baQndMw	2023-06-14 08:38:36.26316
74	Pho 87	Chinese	\N	4	$$	1677	\N	1019 N Broadway	Los Angeles	90012	CA	US	34.0672573	-118.2356333	t	\N	\N	+13232270758	\N	https://s3-media2.fl.yelpcdn.com/bphoto/Q2eXPhJo-RRtdFr-AD59vQ/o.jpg	EiGZST3PxwKs94PTOsD4eQ	2023-06-14 08:38:36.26316
75	Combo A	Chinese	\N	4.5	$$	458	\N	1411 Echo Park Ave	Los Angeles	90026	CA	US	34.07817	-118.25676	t	["pickup"]	\N	+12139287495	\N	https://s3-media1.fl.yelpcdn.com/bphoto/CslYYxGJWpE8CHidXaH6rQ/o.jpg	njyf0pk4spqk5jRLUVlN-A	2023-06-14 08:38:36.26316
76	Eagle Rock Green Dragon	Chinese	\N	4.5	$$	710	\N	1733 Colorado Blvd	Los Angeles	90041	CA	US	34.13971273	-118.2050593	t	["delivery"]	\N	+13232558889	\N	https://s3-media3.fl.yelpcdn.com/bphoto/Obt54K1ksQvdogKmqQRFGg/o.jpg	rHSPK-cm0f9iW1EgUUDhww	2023-06-14 08:38:36.26316
77	Moon House Chinese Cuisine	Chinese	\N	4	$$	1238	\N	11058 Santa Monica Blvd	Los Angeles	90025	CA	US	34.04759054	-118.4432216	t	["pickup"]	\N	+13109669988	\N	https://s3-media4.fl.yelpcdn.com/bphoto/NpU_mlKcNaG46JiPj7HvTg/o.jpg	G2q4Lqe7tEDjMGzazUXdVQ	2023-06-14 08:38:36.26316
78	Heung Rae Gak	Chinese	\N	4	$$	218	\N	357 S Western Ave	Los Angeles	90020	CA	US	34.067312	-118.3092449	t	["pickup"]	\N	+12133830178	\N	https://s3-media3.fl.yelpcdn.com/bphoto/a-KrR1aVmbrstFCymswgTw/o.jpg	r1dZeBu2gIvA2sAL1LpesQ	2023-06-14 08:38:36.26316
79	Din Tai Fung	Chinese	\N	4	$$	4776	\N	177 Caruso Ave	Glendale	91210	CA	US	34.1434651	-118.2560737	t	["pickup"]	\N	+18185515561	\N	https://s3-media4.fl.yelpcdn.com/bphoto/skX_0x37Xyyu-vIxFAaUSg/o.jpg	P_2Z_Wwk2Xtepobtxxsa6A	2023-06-14 08:38:36.26316
80	Qi Steam Kitchen	Chinese	\N	4	$$	181	\N	5966 W Olympic Blvd	Los Angeles	90036	CA	US	34.05761	-118.36165	t	["pickup"]	\N	+13238799313	\N	https://s3-media3.fl.yelpcdn.com/bphoto/5aA4DAiIJZYYv2mkAlZsjQ/o.jpg	TmuztHuzFydP4L6BxBkNXA	2023-06-14 08:38:36.26316
81	Uncle John’s Cafe	Chinese	\N	4	$$	897	\N	834 S Grand Ave	Los Angeles	90017	CA	US	34.04486	-118.25858	t	["pickup"]	\N	+12136233555	\N	https://s3-media2.fl.yelpcdn.com/bphoto/cJ_hAQR5uAN9d2e-gikkyA/o.jpg	6iJ_E5tMJII601mrzwwdrQ	2023-06-14 08:38:36.26316
82	RiceBox	Chinese	\N	4.5	$$	328	\N	541 S Spring St	Los Angeles	90013	CA	US	34.04676	-118.25099	t	["pickup"]	\N	+12139887395	\N	https://s3-media3.fl.yelpcdn.com/bphoto/LvKFVI6uDN_XGJmm69oVqA/o.jpg	hPevQl0mBhTFUXZ0baMq0Q	2023-06-14 08:38:36.26316
83	Wok Bar	Chinese	\N	4	$$	76	\N	3055 W 7th St	Los Angeles	90005	CA	US	34.05992	-118.2908	t	["pickup"]	\N	+12136747122	\N	https://s3-media3.fl.yelpcdn.com/bphoto/bvqtCQndbK0_J2jVD75Ahg/o.jpg	J_lx7R83sKaXGwAE0_YKoA	2023-06-14 08:38:36.26316
84	Pixiu Mala Hongtang	Chinese	\N	4.5	$$	92	\N	425 S Western Ave	Los Angeles	90020	CA	US	34.06635754	-118.3096243	t	\N	\N	+12133409429	\N	https://s3-media1.fl.yelpcdn.com/bphoto/XZBrSm4ryIknEy2MTI43ZQ/o.jpg	0IeIzElSBK1XJVqtzFvRlA	2023-06-14 08:38:36.26316
85	Young King	Chinese	\N	4	$$	645	\N	3100 W Olympic Blvd	Los Angeles	90006	CA	US	34.05244471	-118.3033384	t	["delivery"]	\N	+12134876154	\N	https://s3-media3.fl.yelpcdn.com/bphoto/uARkTwvVk0t-TCH0UVwHAQ/o.jpg	nxOmiITLYE3AdEqrSZIRDg	2023-06-14 08:38:36.26316
86	Warrior Event Space	Chinese	\N	4.5	$$	240	\N	8909 Sunset Blvd	West Hollywood	90069	CA	US	34.090877	-118.3860492	t	\N	\N	+13109990403	\N	https://s3-media3.fl.yelpcdn.com/bphoto/0oljEy2T7538A1S1l6--kg/o.jpg	39XhySXtu-4Oe4XjBGy4vA	2023-06-14 08:38:36.26316
87	Pearl River Deli	Chinese	\N	4.5	$$	280	\N	935 Mei Ling Way	Los Angeles	90012	CA	US	34.06520962	-118.2381254	t	["pickup"]	\N	+12133725485	\N	https://s3-media1.fl.yelpcdn.com/bphoto/2FcziUih0EigPQMVDJOYEw/o.jpg	Mywk3nUsqPvmzJiEOw4XYw	2023-06-14 08:38:36.26316
88	Capital Seafood Beverly Hills	Chinese	\N	4	$$	344	\N	50 N La Cienega Blvd	Beverly Hills	90211	CA	US	34.0669	-118.37592	t	["pickup"]	\N	+13108551234	\N	https://s3-media3.fl.yelpcdn.com/bphoto/LcuUdZ8Ln7KxWRHIP4F-hA/o.jpg	CMp0w5cySb4n4XxgmoFdZQ	2023-06-14 08:38:36.26316
89	Kingdom Dim Sum	Chinese	\N	4.5	\N	44	\N	5445 Hollywood Blvd	Los Angeles	90027	CA	US	34.10256	-118.308754	t	["pickup"]	\N	+13233786191	\N	https://s3-media1.fl.yelpcdn.com/bphoto/dDbthq31_iJUwt7ofS8yZQ/o.jpg	sw6oI8DqMt1tAhE-1aecdQ	2023-06-14 08:38:36.26316
90	Wokcano	Chinese	\N	3.5	$$	572	\N	8000 W Sunset Blvd	Los Angeles	90046	CA	US	34.09746	-118.36513	t	["pickup"]	\N	+13234509037	\N	https://s3-media3.fl.yelpcdn.com/bphoto/wIIwbvENlNziIYk5WXCm_A/o.jpg	HPF9Qq-eHyrlLI3GcItQag	2023-06-14 08:38:36.26316
91	Jin China Bistro	Chinese	\N	4.5	$$	152	\N	123 Astronaut Ellison S Onizuka St	Los Angeles	90012	CA	US	34.0502959	-118.2428859	t	["pickup"]	\N	+12136201717	\N	https://s3-media2.fl.yelpcdn.com/bphoto/JB-IUyYX0pFOppeiAD3R0A/o.jpg	7exoIECl15_Dxqev9HCOBQ	2023-06-14 08:38:36.26316
92	Full Moon House	Chinese	\N	4	$$	462	\N	960 N Hill St	Los Angeles	90012	CA	US	34.06603994	-118.2376204	t	["pickup"]	\N	+12135370792	\N	https://s3-media4.fl.yelpcdn.com/bphoto/SofvP6r434v1w_v-UsmI3g/o.jpg	bJeMe365G76fcnFqBHxppg	2023-06-14 08:38:36.26316
93	Little Wang Kung	Chinese	\N	4	$	96	\N	691 S Hoover St	Los Angeles	90005	CA	US	34.06018568	-118.2845626	t	["delivery"]	\N	+12134873749	\N	https://s3-media3.fl.yelpcdn.com/bphoto/LQt91TKScS5XbVnWJq8efA/o.jpg	Tp-_MRF7EY64ryE-_jUFFQ	2023-06-14 08:38:36.26316
94	Chinatown Express	Chinese	\N	4.5	$	108	\N	4201 Beverly Blvd	Los Angeles	90004	CA	US	34.076665	-118.300666	t	["pickup"]	\N	+13234867565	\N	https://s3-media1.fl.yelpcdn.com/bphoto/ycbjUneWmmmq1XHFfyvzng/o.jpg	VBJD0FVv5gxyYltvnwi5qQ	2023-06-14 08:38:36.26316
95	Asian Fusion	Chinese	\N	4	$$	389	\N	1710 S Robertson Blvd	Los Angeles	90035	CA	US	34.0485068	-118.3854659	t	["pickup"]	\N	+14242988247	\N	https://s3-media1.fl.yelpcdn.com/bphoto/zDIGTxtO5Ni5hTmUAlCIYQ/o.jpg	OFIAeSeO-LHmZMN5sh3pXw	2023-06-14 08:38:36.26316
96	Long's Family Pastry	Chinese	\N	4	$	392	\N	715 N Spring St	Los Angeles	90012	CA	US	34.0603609	-118.2378286	t	["pickup"]	\N	+12136225255	\N	https://s3-media2.fl.yelpcdn.com/bphoto/zdfc5MgKsgS_0IvPfpqmfA/o.jpg	i1Dhxjfx6N-K47A6PZ0zow	2023-06-14 08:38:36.26316
97	Kyodong Noodles	Chinese	\N	3.5	$$	138	\N	621 S Western Ave	Los Angeles	90005	CA	US	34.0626977	-118.3096198	t	["pickup"]	\N	+12133800664	\N	https://s3-media4.fl.yelpcdn.com/bphoto/jTKXiDTaD1HokKzOTBmoiA/o.jpg	pwX0Cg8jZyluvyPgqwCw4A	2023-06-14 08:38:36.26316
98	Zen Mei Bistro	Chinese	\N	4.5	$	195	\N	800 Yale St	Los Angeles	90012	CA	US	34.06335	-118.24046	t	["delivery"]	\N	+12136267113	\N	https://s3-media2.fl.yelpcdn.com/bphoto/8POhUYIBgj3tJWPYtMp74A/o.jpg	YOweM9fyWC4nFvpR_lytlA	2023-06-14 08:38:36.26316
99	Little China	Chinese	\N	4	\N	39	\N	3636 W Olympic Blvd	Los Angeles	90019	CA	US	34.052698	-118.3183179	t	\N	\N	+13237301890	\N	https://s3-media2.fl.yelpcdn.com/bphoto/apJ_RQF7rZ5YaS7QwDNJ0w/o.jpg	-RB75P7rg6Jyp8ZMegSmCA	2023-06-14 08:38:36.26316
100	Queen Violet WeHo	Chinese	\N	4	$$	295	\N	8543 Santa Monica Blvd	West Hollywood	90069	CA	US	34.0890893	-118.3777347	t	["pickup"]	\N	+14247770357	\N	https://s3-media2.fl.yelpcdn.com/bphoto/V9GgOKlIpeAG2RHDzF-BLA/o.jpg	WB_7Uw0qrmeJLsRPpZWmnw	2023-06-14 08:38:36.26316
101	Guisados	Mexican	\N	4.5	$$	2397	\N	1261 W Sunset Blvd	Los Angeles	90026	CA	US	34.07023951	-118.2504484	t	["pickup"]	\N	+12132507600	\N	https://s3-media1.fl.yelpcdn.com/bphoto/JqGxcZ8L2TmRLYRNf59G_g/o.jpg	BDRVlHnK4l0T0ANb7M-Eqg	2023-06-14 08:38:36.26316
102	Toca Madera - Los Angeles	Mexican	\N	4	$$$	3022	\N	8450 W 3rd St	Los Angeles	90048	CA	US	34.073059	-118.3749338	t	["delivery"]	\N	+13238529400	\N	https://s3-media3.fl.yelpcdn.com/bphoto/VhKhpEeBitIQJC20K80UVA/o.jpg	LNb-ElJwKIXS6Lx5xdRB1Q	2023-06-14 08:38:36.26316
103	Holbox	Mexican	\N	5	$$	812	\N	3655 S Grand Ave	Los Angeles	90007	CA	US	34.01741823	-118.2784318	t	["pickup"]	\N	+12139869972	\N	https://s3-media1.fl.yelpcdn.com/bphoto/McBflvxephYn8tSRrtwUhQ/o.jpg	-5TFq3V--bffJGW000YuGQ	2023-06-14 08:38:36.26316
104	El Paseo Inn	Mexican	\N	4	$$	1587	\N	11 E Olvera St	Los Angeles	90012	CA	US	34.05748236	-118.2377401	t	["delivery"]	\N	+12136261361	\N	https://s3-media1.fl.yelpcdn.com/bphoto/D-v-9TKDjB743rLgSPJZEA/o.jpg	4Ttfvrc3S3xW1sxHF-oFPg	2023-06-14 08:38:36.26316
105	Benny's Tacos & Rotisserie Chicken in Westchester	Mexican	\N	4.5	$$	3269	\N	7101 W Manchester Ave	Los Angeles	90045	CA	US	33.95998	-118.41685	t	["pickup"]	\N	+13106708226	\N	https://s3-media2.fl.yelpcdn.com/bphoto/m2gNJH8GaINEr18GqRXBLg/o.jpg	uA3TautyZ7bby0w8Scwufg	2023-06-14 08:38:36.26316
106	Guisados DTLA	Mexican	\N	4.5	$	2065	\N	541 S Spring St	Los Angeles	90013	CA	US	34.0465306	-118.2506799	t	["pickup"]	\N	+12136277656	\N	https://s3-media3.fl.yelpcdn.com/bphoto/y85JlPT7EGbOj_z5zRflXg/o.jpg	VqG_rccDoUXreiaHH0DEUA	2023-06-14 08:38:36.26316
107	Leo's Tacos Truck	Mexican	\N	4.5	$	2296	\N	1515 S La Brea Ave	Los Angeles	90019	CA	US	34.046438	-118.345718	t	["delivery"]	\N	+13233462001	\N	https://s3-media1.fl.yelpcdn.com/bphoto/ca0rQts_zpHQRqq4I1jBaA/o.jpg	QKovUc1TmSNtZh0j5ZEagw	2023-06-14 08:38:36.26316
108	Guelaguetza Restaurante	Mexican	\N	4	$$	2762	\N	3014 W Olympic Blvd	Los Angeles	90006	CA	US	34.05241	-118.30071	t	["pickup"]	\N	+12134270608	\N	https://s3-media1.fl.yelpcdn.com/bphoto/36frnku5tXrNezug0O5eXA/o.jpg	IzRINfSLBr6k_dq1e2WNew	2023-06-14 08:38:36.26316
109	Sugar Taco	Mexican	\N	4.5	$$	1046	\N	7257 Melrose Ave	Los Angeles	90046	CA	US	34.08370683	-118.3478443	t	["pickup"]	\N	+13105268004	\N	https://s3-media3.fl.yelpcdn.com/bphoto/PLq9ENEorPdPnACvkw3Agg/o.jpg	DoyIC0ElqglrlHBKDxXOwg	2023-06-14 08:38:36.26316
110	Pez Cantina	Mexican	\N	4	$$	1196	\N	401 S Grand Ave	Los Angeles	90071	CA	US	34.051487	-118.2532958	t	["pickup"]	\N	+12132582280	\N	https://s3-media4.fl.yelpcdn.com/bphoto/aMAmgIEMcUxEgGBBZqNlOg/o.jpg	hIythZZ3mpPwwhSJkUuJQQ	2023-06-14 08:38:36.26316
111	Yxta Cocina Mexicana	Mexican	\N	4	$$	1249	\N	601 S Central Ave	Los Angeles	90021	CA	US	34.03908028	-118.2404277	t	["pickup"]	\N	+12135965579	\N	https://s3-media1.fl.yelpcdn.com/bphoto/zAEqMypRSrcSDuFITRVCAA/o.jpg	b1CxnE2kErynRw9PQ8G_9Q	2023-06-14 08:38:36.26316
112	Taqueria Los Anaya	Mexican	\N	4.5	$$	1453	\N	4651 W Adams Blvd	Los Angeles	90016	CA	US	34.0327911	-118.3417282	t	["delivery"]	\N	+13237314070	\N	https://s3-media2.fl.yelpcdn.com/bphoto/4zjN9DxYWCrMY1xDbshR4Q/o.jpg	6Dd4kTDiikEB3wQp___0fA	2023-06-14 08:38:36.26316
113	Chichen Itza Restaurant	Mexican	\N	4.5	$$	1391	\N	3655 S Grand Ave	Los Angeles	90007	CA	US	34.017358	-118.278406	t	["pickup"]	\N	+12137411075	\N	https://s3-media3.fl.yelpcdn.com/bphoto/xAOhzSK_4YlKo--48ElC-w/o.jpg	vC_6J_nGyf4J8xt-Vu6Shw	2023-06-14 08:38:36.26316
114	Mamá Por Dios	Mexican	\N	4	$$	1740	\N	8722 W 3rd St	Los Angeles	90048	CA	US	34.073437	-118.382488	t	["delivery"]	\N	+14242843052	\N	https://s3-media1.fl.yelpcdn.com/bphoto/t9y0Ws_oMWQvQQAN-kEgRA/o.jpg	T_Hiq_zgUz3C3Rlj843ZAw	2023-06-14 08:38:36.26316
115	Mercado	Mexican	\N	4	$$$	1332	\N	7910 W 3rd St	Los Angeles	90048	CA	US	34.0715151	-118.3622707	t	["pickup"]	\N	+13239440947	\N	https://s3-media4.fl.yelpcdn.com/bphoto/p1DGUGfmtXlZ9WYdG470oA/o.jpg	phMPgmi6-yh3Qs_PRbTT1g	2023-06-14 08:38:36.26316
116	Mercado Hollywood	Mexican	\N	4.5	$$$	824	\N	3413 Cahuenga Blvd W	Los Angeles	90068	CA	US	34.13166	-118.35262	t	["pickup"]	\N	+13235122500	\N	https://s3-media4.fl.yelpcdn.com/bphoto/OCeK3eNZecAPgKDPwbXVWg/o.jpg	bKeJWK8yxAo0x5y_0kGyVA	2023-06-14 08:38:36.26316
117	The Grain Cafe	Mexican	\N	4.5	$$	1108	\N	4222 W Pico Blvd	Los Angeles	90019	CA	US	34.04762	-118.32758	t	["pickup"]	\N	+13239314034	\N	https://s3-media1.fl.yelpcdn.com/bphoto/z7NWvGIuXMHj1o2IL1qSfA/o.jpg	iD-G9bACYgkBWOq_IAGVVA	2023-06-14 08:38:36.26316
118	Hermanito	Mexican	\N	4.5	$$$	597	\N	2024 Sawtelle Blvd	Los Angeles	90025	CA	US	34.04048617	-118.4429078	t	["delivery"]	\N	+14243882585	\N	https://s3-media1.fl.yelpcdn.com/bphoto/5vyBgJqt0sxlenS3iBF3wA/o.jpg	VqxDHnbjfwwJXON7ERabOw	2023-06-14 08:38:36.26316
119	Gracias Madre - West Hollywood	Mexican	\N	4	$$	4930	\N	8905 Melrose Ave	West Hollywood	90069	CA	US	34.08079511	-118.386972	t	["pickup"]	\N	+13239782170	\N	https://s3-media4.fl.yelpcdn.com/bphoto/rm7dBf-KDF596F6iWAO6TQ/o.jpg	EWbbiUBkGzCYrEoOF05HzA	2023-06-14 08:38:36.26316
120	Tlayuda L.A. Restaurant	Mexican	\N	4.5	$$	850	\N	5450 Santa Monica Blvd	Los Angeles	90029	CA	US	34.0906351	-118.307928	t	["pickup"]	\N	+13239635045	\N	https://s3-media1.fl.yelpcdn.com/bphoto/g0x_XhpiHjOeVWETk9Oc3A/o.jpg	Lop79P2KM9zFUCCaBYz6zA	2023-06-14 08:38:36.26316
121	Guisados	Mexican	\N	4.5	$$	2648	\N	2100 East Cesar E Chavez Ave	Los Angeles	90033	CA	US	34.04812	-118.21147	t	["pickup"]	\N	+13232647201	\N	https://s3-media3.fl.yelpcdn.com/bphoto/I49Z9N-WOs07YQUcl5gpZg/o.jpg	qpcH_Fub586U2kw_pQJS3w	2023-06-14 08:38:36.26316
122	Guerrilla Tacos	Mexican	\N	4	$$	1122	\N	2000 E 7th St	Los Angeles	90021	CA	US	34.03445579	-118.2321303	t	["delivery"]	\N	+12133753300	\N	https://s3-media1.fl.yelpcdn.com/bphoto/XpT4_U10bzB27ut8893meA/o.jpg	SNlf3YpKkDG-e4R9jkwLhA	2023-06-14 08:38:36.26316
123	Somos Oaxaca	Mexican	\N	4.5	$$	82	\N	3224 Venice Blvd	Los Angeles	90019	CA	US	34.04333	-118.31965	t	["delivery"]	\N	+13239980339	\N	https://s3-media3.fl.yelpcdn.com/bphoto/lEIFZOmRcDAxUbO9y26Adw/o.jpg	NJ5zXTQzIlkG-EhDwqMaIQ	2023-06-14 08:38:36.26316
124	Mezcalero	Mexican	\N	4	$$	669	\N	510 S Broadway	Los Angeles	90013	CA	US	34.04751	-118.25072	t	["delivery"]	\N	+12136283337	\N	https://s3-media1.fl.yelpcdn.com/bphoto/c_fpzTeWyn-tk9flxtomYQ/o.jpg	yyTLKAplUF89xydeB2bZWQ	2023-06-14 08:38:36.26316
125	Quiadaiyn Restaurant	Mexican	\N	4.5	$$	362	\N	12326 Venice Blvd	Los Angeles	90066	CA	US	34.003606	-118.4329843	t	["pickup"]	\N	+13103137654	\N	https://s3-media1.fl.yelpcdn.com/bphoto/NCdQfTmCx-Bwf0qs6wdadA/o.jpg	6ZUvXgNrDiJ5vHDRXdshpA	2023-06-14 08:38:36.26316
126	Ka'teen	Mexican	\N	4	\N	512	\N	6516 Selma Ave	Los Angeles	90028	CA	US	34.09948	-118.33167	t	["delivery"]	\N	+13234106360	\N	https://s3-media2.fl.yelpcdn.com/bphoto/LYXELgjRFE7ByMhEWiDNDQ/o.jpg	dnYh7aAv1O5RwseWGdLOKQ	2023-06-14 08:38:36.26316
127	Mirate	Mexican	\N	4	\N	286	\N	1712 N Vermont Ave	Los Angeles	90027	CA	US	34.102201	-118.291466	t	["delivery"]	\N	+13236497937	\N	https://s3-media1.fl.yelpcdn.com/bphoto/eTgtZFV3dInYkJphunu4iw/o.jpg	fLs0ykxe4Iw1_3htMWqcTQ	2023-06-14 08:38:36.26316
128	Sonoratown	Mexican	\N	4.5	$$	1779	\N	208 E 8th St	Los Angeles	90014	CA	US	34.041648	-118.252245	t	["pickup"]	\N	+12132225071	\N	https://s3-media3.fl.yelpcdn.com/bphoto/OQ6IV1KElEvxlQ1kv1He1Q/o.jpg	Ti2Ksp2oPj6rpdp2tQcaVA	2023-06-14 08:38:36.26316
129	Mex Peru Gipsy	Mexican	\N	5	$$	1546	\N	414 E 12th St	Los Angeles	90015	CA	US	34.03518711	-118.2559254	t	["pickup"]	\N	+12137481773	\N	https://s3-media1.fl.yelpcdn.com/bphoto/_XRM04RXlzNcj25F5bvpNQ/o.jpg	beA_DlDpij8O9xK2B-NjEA	2023-06-14 08:38:36.26316
130	La Numero Uno	Mexican	\N	4.5	$$	512	\N	1247 Vine St	Los Angeles	90038	CA	US	34.0938088	-118.3268092	t	["pickup"]	\N	+13239571111	\N	https://s3-media4.fl.yelpcdn.com/bphoto/QLgk_KIwzOx_UMFmHEb7cg/o.jpg	f2V2OzCi0eNe9I-XnJOuwg	2023-06-14 08:38:36.26316
131	Te'Kila	Mexican	\N	4	$$	1186	\N	6541 Hollywood Blvd	Los Angeles	90028	CA	US	34.101795	-118.3323928	t	["pickup"]	\N	+13239602404	\N	https://s3-media3.fl.yelpcdn.com/bphoto/qOUu4vWhAjBGcWfSufhpeg/o.jpg	kr9RZATtNwJznY9TaMexUA	2023-06-14 08:38:36.26316
132	LA Cha Cha Chá	Mexican	\N	4	$$$	608	\N	812 E 3rd St	Los Angeles	90013	CA	US	34.04558	-118.2357	t	["pickup"]	\N	\N	\N	https://s3-media1.fl.yelpcdn.com/bphoto/GDIhQTC9eELE2ibY4BxtAA/o.jpg	UUL3cdDeCA0gZIa8lBO1zg	2023-06-14 08:38:36.26316
133	Sonoritas Prime Tacos	Mexican	\N	4	$$	1794	\N	2004 Sawtelle Blvd	Los Angeles	90025	CA	US	34.04093	-118.44328	t	["pickup"]	\N	+13104449100	\N	https://s3-media2.fl.yelpcdn.com/bphoto/VH_w93WSWOIRAFrEqStf-Q/o.jpg	9oQnnXSTo8i2TliFPktxLg	2023-06-14 08:38:36.26316
134	Cascabel	Mexican	\N	4	$$	1054	\N	10717 Riverside Dr	Los Angeles	91602	CA	US	34.15258	-118.36437	t	["delivery"]	\N	+18189274210	\N	https://s3-media1.fl.yelpcdn.com/bphoto/IZjVCmwPLSn28i03rjTd7w/o.jpg	cz_0AmDhRH7T_iRvvx0THg	2023-06-14 08:38:36.26316
135	Damian	Mexican	\N	4	$$$$	296	\N	2132 E 7th Pl	Los Angeles	90021	CA	US	34.03357583	-118.2290948	t	["delivery"]	\N	+12132700178	\N	https://s3-media1.fl.yelpcdn.com/bphoto/D2qL4Tz1lTbxAXchHnBYOA/o.jpg	n8cs5yUAG6XVn52eMChCNw	2023-06-14 08:38:36.26316
136	Mariscos Jalisco	Mexican	\N	4.5	$	1118	\N	3040 E Olympic Blvd	Los Angeles	90023	CA	US	34.0210515	-118.2128054	t	["delivery"]	\N	+13235286701	\N	https://s3-media2.fl.yelpcdn.com/bphoto/I-bHSJ-cuC9VtNXySczARw/o.jpg	5xFBQiB4Jcy9sI2fUHfcpg	2023-06-14 08:38:36.26316
137	HomeState	Mexican	\N	4.5	$$	1360	\N	4624 Hollywood Blvd	Los Angeles	90027	CA	US	34.09979	-118.29021	t	["pickup"]	\N	+13239061122	\N	https://s3-media3.fl.yelpcdn.com/bphoto/w9UK3IM71W2R3Rqe8kn0sw/o.jpg	ul2dT8QzauKP5Yc-q_DZ_g	2023-06-14 08:38:36.26316
138	La Esquinita Baja Grill	Mexican	\N	5	\N	63	\N	1205 Venice Blvd	Los Angeles	90006	CA	US	34.042786	-118.281284	t	["pickup"]	\N	+12133185078	\N	https://s3-media2.fl.yelpcdn.com/bphoto/pKMYpuJj_GTtX0uYBNq9rQ/o.jpg	7Qgag1l5SrtvSJTHLBm_AQ	2023-06-14 08:38:36.26316
139	El Granjero Cantina	Mexican	\N	4	$$	134	\N	6333 W 3rd St	Los Angeles	90036	CA	US	34.07184331	-118.3598999	t	["delivery"]	\N	+13238799324	\N	https://s3-media2.fl.yelpcdn.com/bphoto/SuhKU5yTTjQ8hh-F2-QQSg/o.jpg	7RJAk85utbsK5OEvF5YHjQ	2023-06-14 08:38:36.26316
140	Madre Oaxacan Restaurant and Mezcaleria	Mexican	\N	4	$$	1189	\N	10426 National Blvd	Los Angeles	90034	CA	US	34.0287002	-118.4114403	t	["pickup"]	\N	+13105594732	\N	https://s3-media1.fl.yelpcdn.com/bphoto/ah5yPIchEgAR-cNyJNBVGA/o.jpg	MjWMuWJNlxNXr-KmAXL8KQ	2023-06-14 08:38:36.26316
141	Chef Kang Korean Taco	Mexican	\N	4.5	\N	58	\N	3959 Wilshire Blvd	Los Angeles	90010	CA	US	34.06204	-118.3133	t	["pickup"]	\N	+12139086092	\N	https://s3-media4.fl.yelpcdn.com/bphoto/EAtIiE4ZbdJF4YCof_Bfgw/o.jpg	ho3kMMflXm9q9skQui4ioQ	2023-06-14 08:38:36.26316
142	La Barca Restaurant	Mexican	\N	4	$$	1028	\N	2414 S Vermont Ave	Los Angeles	90007	CA	US	34.03392016	-118.291485	t	["delivery"]	\N	+13237356567	\N	https://s3-media1.fl.yelpcdn.com/bphoto/yrmn2yCY5fn8WCOGS53slQ/o.jpg	FBRxoQSWtziiU_A5tscVGA	2023-06-14 08:38:36.26316
143	Sonoritas Prime Tacos	Mexican	\N	4	$$	252	\N	1050 S Flower St	Los Angeles	90015	CA	US	34.04314	-118.26371	t	["delivery"]	\N	+12132751826	\N	https://s3-media1.fl.yelpcdn.com/bphoto/HMHlncxo9Y9fNSLQx0-qsw/o.jpg	Ke3WFbRKFHOW7Ity6vO0jQ	2023-06-14 08:38:36.26316
144	Tacos Tumbras a Tomas	Mexican	\N	4	$	1114	\N	317 S Broadway	Los Angeles	90013	CA	US	34.050649	-118.248831	t	["delivery"]	\N	+12136201071	\N	https://s3-media2.fl.yelpcdn.com/bphoto/dov5VBTNvAqvFOf1sRvTWQ/o.jpg	520Wd4FU_DixBprFQQnnxg	2023-06-14 08:38:36.26316
145	HanShik Express	Mexican	\N	4.5	$$	193	\N	3959 Wilshire Blvd	Los Angeles	90010	CA	US	34.06204	-118.3133	t	["pickup"]	\N	+12139086092	\N	https://s3-media2.fl.yelpcdn.com/bphoto/VV8xsi6zGHsY5LpCFNb7eQ/o.jpg	v93hPyb_VYFHYz7t_jAlhw	2023-06-14 08:38:36.26316
146	La Chuperia	Mexican	\N	4.5	$$	393	\N	3742 S. Flower St.	Los Angeles	90007	CA	US	34.016551	-118.281564	t	["pickup"]	\N	+12136772388	\N	https://s3-media1.fl.yelpcdn.com/bphoto/pxSyLY8s9H0q7QKBQlddHg/o.jpg	lXipm1mnODP19kdviBqn4g	2023-06-14 08:38:36.26316
147	Casita del Campo	Mexican	\N	4	$$	941	\N	1920 Hyperion Ave	Los Angeles	90027	CA	US	34.09745	-118.27499	t	["pickup"]	\N	+13236624255	\N	https://s3-media4.fl.yelpcdn.com/bphoto/x_aVenS_-B0_eqZ2B7Bl6g/o.jpg	RdLz9GVW48pu2XmhrMsLUg	2023-06-14 08:38:36.26316
148	El Cartel	Mexican	\N	4	$	628	\N	5515 Wilshire Blvd	Los Angeles	90036	CA	US	34.06251215	-118.3488146	t	["pickup"]	\N	+13239311281	\N	https://s3-media1.fl.yelpcdn.com/bphoto/QFImL7ASAzJKRNgor5-nKA/o.jpg	Bq6I52mOTyC2iDHU2rh_5w	2023-06-14 08:38:36.26316
149	Tere's Mexican Grill	Mexican	\N	4	$$	649	\N	5870 Melrose Ave	Los Angeles	90038	CA	US	34.08321	-118.3284836	t	["pickup"]	\N	+13234689345	\N	https://s3-media1.fl.yelpcdn.com/bphoto/NDHlVTF2DdXjCP0Ugfsd6Q/o.jpg	azyDb-6veFabKKIfLleiMg	2023-06-14 08:38:36.26316
150	Casa Fina Restaurant & Cantina	Mexican	\N	4	$$	793	\N	1842 E First St	Los Angeles	90033	CA	US	34.0466	-118.21837	t	["pickup"]	\N	+13236049592	\N	https://s3-media4.fl.yelpcdn.com/bphoto/qvsS327Jp2tloVO406IB3A/o.jpg	1pa6C6pBW5MJdZjsAQRa2A	2023-06-14 08:38:36.26316
151	Baekjeong - Los Angeles	Korean	\N	4.5	$$$	4935	\N	3465 W 6th St	Los Angeles	90020	CA	US	34.06375299	-118.2972829	t	["pickup"]	\N	+12133849678	\N	https://s3-media3.fl.yelpcdn.com/bphoto/izhJQsGE5LZAHQb-WmNwSA/o.jpg	qAAoilHU25Qr45FOQlA19g	2023-06-14 08:38:36.26316
152	Hangari Kalguksu	Korean	\N	4.5	$$	2446	\N	3470 W 6th St	Los Angeles	90020	CA	US	34.06286026	-118.2975703	t	["pickup"]	\N	+12133882326	\N	https://s3-media3.fl.yelpcdn.com/bphoto/X_U65O9YnvMyb42h1BZ0JQ/o.jpg	h1R2iKYdm2lwukzMJvJqDw	2023-06-14 08:38:36.26316
153	Genwa Korean BBQ Mid Wilshire	Korean	\N	4.5	$$$	3073	\N	5115 Wilshire Blvd	Los Angeles	90036	CA	US	34.06232132	-118.340899	t	["pickup"]	\N	+13235490760	\N	https://s3-media2.fl.yelpcdn.com/bphoto/n6VHst4bi3Mq4ZUU3qfhYg/o.jpg	KtEMG1Aln3vQzte92QJxlw	2023-06-14 08:38:36.26316
154	Quarters Korean BBQ	Korean	\N	4	$$	3548	\N	3465 W 6th St	Los Angeles	90020	CA	US	34.06402022	-118.2976871	t	["pickup"]	\N	+12133658111	\N	https://s3-media2.fl.yelpcdn.com/bphoto/bPhelzReeQoCaL4fdOH9KA/o.jpg	TsVu9GJQwuFBZVP_sg2k7A	2023-06-14 08:38:36.26316
155	Woo Hyang Woo	Korean	\N	4.5	$$$	1011	\N	3429 W 6th St	Los Angeles	90020	CA	US	34.063763	-118.296482	t	\N	\N	+12133155080	\N	https://s3-media1.fl.yelpcdn.com/bphoto/ij2m4yEy87jxfMhBvgDdGg/o.jpg	UaxSpacBpGQrXv9Cytai2A	2023-06-14 08:38:36.26316
156	Concerto	Korean	\N	4	$$	1394	\N	610 S Serrano Ave	Los Angeles	90005	CA	US	34.063071	-118.306414	t	["pickup"]	\N	+12137380909	\N	https://s3-media1.fl.yelpcdn.com/bphoto/W0PtAkmnwrk0wf7bcwOoDA/o.jpg	IMoMSsC3oDqcNZCQXyo8iQ	2023-06-14 08:38:36.26316
157	BCD Tofu House	Korean	\N	4	$$	4943	\N	3575 Wilshire Blvd	Los Angeles	90010	CA	US	34.06208625	-118.3026584	t	["pickup"]	\N	+12133826677	\N	https://s3-media3.fl.yelpcdn.com/bphoto/nz9rfHrjOIL5dyU8uNPTVQ/o.jpg	HTFByVH44biQsc_R8sEOjg	2023-06-14 08:38:36.26316
158	TOKKI - Korean Tapas	Korean	\N	4.5	\N	441	\N	3465 W 6th St	Los Angeles	90020	CA	US	34.06371	-118.29727	t	\N	\N	+18185272213	\N	https://s3-media4.fl.yelpcdn.com/bphoto/YOfQKjcMGU1iGzNOSIcHNg/o.jpg	wvaNbC16NuJIQD0g8WPjRw	2023-06-14 08:38:36.26316
159	Soowon Galbi KBBQ Restaurant	Korean	\N	4.5	$$	2833	\N	856 S Vermont Ave	Los Angeles	90005	CA	US	34.05644156	-118.2913385	t	["delivery"]	\N	+12133659292	\N	https://s3-media1.fl.yelpcdn.com/bphoto/0GkZ8e0y5wAXRlWJJcEYLA/o.jpg	9FuxqbYXM0vaPnzrQ7B_qQ	2023-06-14 08:38:36.26316
160	Hae Jang Chon	Korean	\N	4	$$$	5623	\N	3821 W 6th St	Los Angeles	90020	CA	US	34.06383295	-118.3061257	t	["pickup"]	\N	+12133898777	\N	https://s3-media2.fl.yelpcdn.com/bphoto/UE_ZY3fBqOaun7z-75Drbw/o.jpg	JYGPEUZy4k5ObXGIjcD3DA	2023-06-14 08:38:36.26316
161	Hanu Korean BBQ	Korean	\N	5	\N	944	\N	2999 W 6th St	Los Angeles	90020	CA	US	34.06386	-118.28675	t	\N	\N	+12137387370	\N	https://s3-media1.fl.yelpcdn.com/bphoto/ZbZwNv64F8cTAJi6brDrRg/o.jpg	T3cqmVnThp8qA0JV7Z2D4w	2023-06-14 08:38:36.26316
162	Bulgogi Hut	Korean	\N	4.5	$$$	3637	\N	3600 Wilshire Blvd	Los Angeles	90010	CA	US	34.061564	-118.303271	t	["pickup"]	\N	+12133881988	\N	https://s3-media2.fl.yelpcdn.com/bphoto/0RDfmlcAipXgmtwC8DtHQQ/o.jpg	frRPjJ03Ie5h9EPhFhjNIw	2023-06-14 08:38:36.26316
163	Ahgassi Gopchang	Korean	\N	4.5	$$$	2178	\N	3744 W 6th St	Los Angeles	90005	CA	US	34.06340679	-118.3038818	t	["delivery"]	\N	+13239026328	\N	https://s3-media3.fl.yelpcdn.com/bphoto/UayThUPLzWBaGtnVB_dXew/o.jpg	INEbr7OmgiqlMWq5Cta8WA	2023-06-14 08:38:36.26316
164	Majordomo	Korean	\N	4	$$$	1315	\N	1725 Naud St	Los Angeles	90012	CA	US	34.0690575	-118.226105	t	["delivery"]	\N	+13235454880	\N	https://s3-media2.fl.yelpcdn.com/bphoto/EQYwq5LE2h6rWhtoEwiODg/o.jpg	4Zx7Lw4U6F0sXrV4aiIyqQ	2023-06-14 08:38:36.26316
165	Gangnam Station Korean BBQ	Korean	\N	4.5	$$	1228	\N	3785 Wilshire Blvd	Los Angeles	90010	CA	US	34.06186	-118.30848	t	\N	\N	+12139086700	\N	https://s3-media3.fl.yelpcdn.com/bphoto/p6ZW1_YhMcNnsRayaI7cGg/o.jpg	Xcl1eK5jHzx6x7wOKRWWDg	2023-06-14 08:38:36.26316
166	Ssam Korean BBQ	Korean	\N	4.5	$$$	1355	\N	1040 S Western Ave	Los Angeles	90006	CA	US	34.051323	-118.308791	t	["pickup"]	\N	+13237379292	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ZZS_l52q5nNrf4f1FDHfiQ/o.jpg	4zy0JiIP9d173nbynUu0OQ	2023-06-14 08:38:36.26316
167	Seoul Salon Restaurant & Bar	Korean	\N	4.5	$$	184	\N	3600 Wilshire Blvd	Los Angeles	90005	CA	US	34.06153666	-118.3037314	t	["restaurant_reservation"]	\N	+12136747363	\N	https://s3-media3.fl.yelpcdn.com/bphoto/9XP9MBCRVgrKKighS_dT0g/o.jpg	RpljDiS3TghWGL4ZezUxGw	2023-06-14 08:38:36.26316
168	Paik's Noodle: Hong Kong Ban Jum 0410	Korean	\N	4.5	$$	790	\N	3470 W 6th St	Los Angeles	90020	CA	US	34.06279582	-118.2977393	t	\N	\N	+12133890410	\N	https://s3-media1.fl.yelpcdn.com/bphoto/SblfBrbr4OjqMP8o30XAYg/o.jpg	WWQsHGIFUkNQF6Uaj4vXCw	2023-06-14 08:38:36.26316
169	Kobawoo House	Korean	\N	4.5	$$	1422	\N	698 S Vermont Ave	Los Angeles	90005	CA	US	34.06013289	-118.2910148	t	["pickup"]	\N	+12133897300	\N	https://s3-media2.fl.yelpcdn.com/bphoto/KhZfyOnlF507uEwNbTZLqg/o.jpg	TWHGJkTAbF22hvXeReQp9w	2023-06-14 08:38:36.26316
170	Sun Nong Dan	Korean	\N	4.5	$$	712	\N	710 S Western Ave	Los Angeles	90005	CA	US	34.05916424	-118.308797	t	["pickup"]	\N	+12132643303	\N	https://s3-media1.fl.yelpcdn.com/bphoto/zBtO3tfKwMVfT-szaFS44Q/o.jpg	BAdOTHAvXneDDu4Maqk67g	2023-06-14 08:38:36.26316
171	Eight Korean BBQ	Korean	\N	4.5	$$$	1809	\N	863 S Western Ave	Los Angeles	90005	CA	US	34.05599268	-118.3099368	t	\N	\N	+12133651750	\N	https://s3-media1.fl.yelpcdn.com/bphoto/YYkDOVUT_6wcqttVz-ni_g/o.jpg	KxSkOgk1-IHwK9XgM_N8Ew	2023-06-14 08:38:36.26316
172	Sulga House of Beef Bone Soup	Korean	\N	5	$$	349	\N	4451 Beverly Blvd	Los Angeles	90004	CA	US	34.07642	-118.30557	t	["pickup"]	\N	+13237410669	\N	https://s3-media2.fl.yelpcdn.com/bphoto/AnU8SIXf7FpQiArZYiCCRw/o.jpg	LtQu-lT9Hpm_n_5LcXsdYA	2023-06-14 08:38:36.26316
173	Park's BBQ	Korean	\N	4	$$$	2104	\N	955 S Vermont Ave	Los Angeles	90006	CA	US	34.05381	-118.29196	t	["pickup"]	\N	+12133801717	\N	https://s3-media2.fl.yelpcdn.com/bphoto/sAdjA299-5is6_9fG47-KQ/o.jpg	K-jWQAp9Q-PIXEpN6pspWg	2023-06-14 08:38:36.26316
174	King Chang - LA	Korean	\N	5	\N	309	\N	3732 W 6th St	Los Angeles	90020	CA	US	34.06329	-118.30372	t	["restaurant_reservation"]	\N	+12133185250	\N	https://s3-media3.fl.yelpcdn.com/bphoto/FGJWXOwzW2fhlKev4bv_hA/o.jpg	iRjnWYY5oVJTaZ5teU1vOQ	2023-06-14 08:38:36.26316
175	Han Bat Sul Lung Tang	Korean	\N	4.5	$$	2697	\N	4163 W 5th St	Los Angeles	90020	CA	US	34.065414	-118.3095703	t	["delivery"]	\N	+12133839499	\N	https://s3-media2.fl.yelpcdn.com/bphoto/YttPoxI3HwOSv5Y3hK_v-Q/o.jpg	uzAbw27XQTXTivjgf2bN2w	2023-06-14 08:38:36.26316
176	MDK Noodles	Korean	\N	4	$$	1603	\N	3630 Wilshire Blvd	Los Angeles	90010	CA	US	34.06155498	-118.3043175	t	["pickup"]	\N	+12133857789	\N	https://s3-media4.fl.yelpcdn.com/bphoto/gQnUKp41bMyq1S-ctzlzGw/o.jpg	LLj451UZrvt3SkZVrEZ4ew	2023-06-14 08:38:36.26316
177	SongHak Korean BBQ	Korean	\N	4.5	$$	387	\N	356 S Western Ave	Los Angeles	90020	CA	US	34.06737	-118.30892	t	["delivery"]	\N	+12135294008	\N	https://s3-media1.fl.yelpcdn.com/bphoto/vcye9LN5rVC9h-VF1GKdNg/o.jpg	IBthDLHW6EPfIgOHuwhf7w	2023-06-14 08:38:36.26316
178	Yuk Dae Jang	Korean	\N	4.5	$$	721	\N	3033 W 6th St	Los Angeles	90020	CA	US	34.06404114	-118.288063	t	["pickup"]	\N	+12133521331	\N	https://s3-media2.fl.yelpcdn.com/bphoto/5y-hXEjEBMMuGJFopTuvFQ/o.jpg	3C2wUqSkpY4-N0O5ArVjwQ	2023-06-14 08:38:36.26316
179	BROKEN MOUTH | Lee's Homestyle	Korean	\N	5	$$	1571	\N	718 S Los Angeles St	Los Angeles	90014	CA	US	34.042734	-118.250779	t	["pickup"]	\N	+12134189588	\N	https://s3-media2.fl.yelpcdn.com/bphoto/PJlPMTnxBb-pxm9OkmKPhQ/o.jpg	CcqraT0cuGKYEcZ1ri_kxg	2023-06-14 08:38:36.26316
180	Chadolpoong	Korean	\N	4.5	$$	535	\N	3470 W 6th St	Los Angeles	90020	CA	US	34.06309	-118.29754	t	["delivery"]	\N	+12132632004	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ANa9Z9DwZHuQTvgX6ad3Pg/o.jpg	vs8USEc1A480H8MnmFKs5A	2023-06-14 08:38:36.26316
181	Magal BBQ	Korean	\N	4.5	$$$	1778	\N	3460 W 8th St	Los Angeles	90005	CA	US	34.057544	-118.3055798	t	["pickup"]	\N	+12133831909	\N	https://s3-media1.fl.yelpcdn.com/bphoto/_bKr-z2qeDFcpfcefwM9BA/o.jpg	NrzSO_pQ88A3jSMqh_QuNg	2023-06-14 08:38:36.26316
182	The Kimbap	Korean	\N	4.5	$	787	\N	400 S Western Ave	Los Angeles	90020	CA	US	34.06696	-118.30871	t	["delivery"]	\N	+12133802174	\N	https://s3-media1.fl.yelpcdn.com/bphoto/fVigYgaazDzBa6S4_UOdng/o.jpg	PlQjtbZKOw7exAUfrswhNQ	2023-06-14 08:38:36.26316
183	Wi Korean BBQ	Korean	\N	4.5	$$$	613	\N	1101 S Vermont Ave	Los Angeles	90006	CA	US	34.05045659	-118.2919668	t	\N	\N	+12133889291	\N	https://s3-media3.fl.yelpcdn.com/bphoto/RiqW9IIgd5AG4olxdXirEw/o.jpg	7FI5FtEVMb6LNoHYTYbncA	2023-06-14 08:38:36.26316
184	Kinn	Korean	\N	4.5	$$$$	122	\N	3905 W 6th St	Los Angeles	90020	CA	US	34.06364	-118.30812	t	\N	\N	+12132910888	\N	https://s3-media2.fl.yelpcdn.com/bphoto/Yl9Bi64umyfk-uCMj8qF1g/o.jpg	9Ox5M2EbVDFhYdsjKzyJoA	2023-06-14 08:38:36.26316
185	CHD MANDU LA	Korean	\N	4.5	$$	232	\N	3377 Wilshire Blvd	Los Angeles	90010	CA	US	34.06229367	-118.2975762	t	["pickup"]	\N	+12133344333	\N	https://s3-media1.fl.yelpcdn.com/bphoto/f8MqoDRXd2zvEX1XojIGNw/o.jpg	y4X0KfHJ5XWwxMIRukVr1Q	2023-06-14 08:38:36.26316
186	Oakobing	Korean	\N	4.5	$$	1697	\N	3300 W 6th St	Los Angeles	90020	CA	US	34.0634651	-118.294319	t	["pickup"]	\N	+12133871002	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ltXtvKv_l8GasMrrjOtQ2Q/o.jpg	4yS760klyp_nyQwDcwWQIg	2023-06-14 08:38:36.26316
187	JJAN	Korean	\N	4.5	$$	217	\N	3328 W 8th St	Los Angeles	90005	CA	US	34.057493	-118.300632	t	["pickup"]	\N	+12133815838	\N	https://s3-media2.fl.yelpcdn.com/bphoto/oArUl382Y5Y8rXLvFyc3Kw/o.jpg	xz66LQF-f06EtZ89Av6f3A	2023-06-14 08:38:36.26316
188	Goat Restaurant	Korean	\N	5	$$	111	\N	4100 W Pico Blvd	Los Angeles	90019	CA	US	34.047509	-118.324763	t	["pickup"]	\N	+13237359200	\N	https://s3-media2.fl.yelpcdn.com/bphoto/1tY7KmaIDOYTljpoi-0OBw/o.jpg	0KrITDshZGMnv1m7nunoZQ	2023-06-14 08:38:36.26316
189	Jinsol Gukbap La	Korean	\N	4.5	$$	398	\N	4031 W 3rd St	Los Angeles	90020	CA	US	34.06918204	-118.3015013	t	["delivery"]	\N	+12133650097	\N	https://s3-media1.fl.yelpcdn.com/bphoto/UKmw-cYk3Vb75fP20MBz2g/o.jpg	r6-usl4pPnuj9mlP-nEr_g	2023-06-14 08:38:36.26316
190	Yuchun	Korean	\N	4	$$	1290	\N	3185 W Olympic Blvd	Los Angeles	90006	CA	US	34.05279	-118.30607	t	["delivery"]	\N	+12133823815	\N	https://s3-media3.fl.yelpcdn.com/bphoto/muBLmjMewvloADBSL44hQg/o.jpg	xcGGRbDXSGzefu_5dI8wqA	2023-06-14 08:38:36.26316
191	Gol Tong Chicken	Korean	\N	5	$$	1896	\N	361 S Western Ave	Los Angeles	90020	CA	US	34.06742142	-118.3095264	t	["pickup"]	\N	+12137166116	\N	https://s3-media2.fl.yelpcdn.com/bphoto/R491zkfeikrD-q8FRY1ISg/o.jpg	bdm3708B0OJW9xDdaKVH_A	2023-06-14 08:38:36.26316
192	Dan Sung Sa	Korean	\N	4	$$	1170	\N	3317 W 6th St	Los Angeles	90020	CA	US	34.063852	-118.294609	t	["delivery"]	\N	+12134879100	\N	https://s3-media1.fl.yelpcdn.com/bphoto/hWXvbq0rqCBHxq1HNh3G3w/o.jpg	LiOTgwAIorn3tDQz-ZJhaA	2023-06-14 08:38:36.26316
193	Yup Dduk LA	Korean	\N	4.5	$$	2381	\N	3603 W 6th St	Los Angeles	90020	CA	US	34.064009	-118.3007013	t	["pickup"]	\N	+12132632355	\N	https://s3-media1.fl.yelpcdn.com/bphoto/uG2FhJKRx05fmxwsFrcqjA/o.jpg	DrToq9357afdpOyO5w0Y5w	2023-06-14 08:38:36.26316
194	Chosun Galbee	Korean	\N	4	$$$	1834	\N	3330 W Olympic Blvd	Los Angeles	90019	CA	US	34.052144	-118.310428	t	["delivery"]	\N	+13237343330	\N	https://s3-media3.fl.yelpcdn.com/bphoto/ZXuKZ2YSZ46l5dPAxQzQOQ/o.jpg	xinlZt7g7kCgNDoapBvdoA	2023-06-14 08:38:36.26316
195	Jeong Yuk Jeom	Korean	\N	4	$$$	477	\N	621 S Western Ave	Los Angeles	90005	CA	US	34.06296933	-118.3093167	t	["delivery"]	\N	+12133842244	\N	https://s3-media2.fl.yelpcdn.com/bphoto/v1tu1i3HoV6FG9uNJ9U7Sw/o.jpg	-cwr9yJXxSMQZ0GP3NkVog	2023-06-14 08:38:36.26316
196	Zzamong	Korean	\N	4	$$	1361	\N	4255 W 3rd St	Los Angeles	90004	CA	US	34.069295	-118.307192	t	["pickup"]	\N	+12137392747	\N	https://s3-media2.fl.yelpcdn.com/bphoto/6AUVIwPCv8wCZ9FYeCfocw/o.jpg	gWM5n5Tyo5h74t-_lp1WUA	2023-06-14 08:38:36.26316
197	Chung Ki Wa	Korean	\N	4.5	$$$	555	\N	3545 W Olympic Blvd	Los Angeles	90019	CA	US	34.05274963	-118.3160934	t	["pickup"]	\N	+13237370809	\N	https://s3-media3.fl.yelpcdn.com/bphoto/52ViPCUwo0CPfjZ4cRTJ4w/o.jpg	imRZsOK1s4Fpbx0wixfgXw	2023-06-14 08:38:36.26316
198	Ten-Raku	Korean	\N	4	$$	707	\N	4177 W 3rd St	Los Angeles	90020	CA	US	34.06921804	-118.305183	t	["restaurant_reservation"]	\N	+12133808382	\N	https://s3-media3.fl.yelpcdn.com/bphoto/E7KHcPKgHjN5Bh-Ot0qCdg/o.jpg	ctB_3PPniGMzs49wEqDF7g	2023-06-14 08:38:36.26316
199	hanchic.	Korean	\N	4.5	$$	323	\N	2500 W 8th St	Los Angeles	90057	CA	US	34.056578	-118.282535	t	["pickup"]	\N	+12133757095	\N	https://s3-media1.fl.yelpcdn.com/bphoto/8yXc-O096Y4N2s7lDcoz0w/o.jpg	hI1lsLwckjRqoYt1zHrVVA	2023-06-14 08:38:36.26316
200	Western Doma Noodles	Korean	\N	4	$$	636	\N	429 N Western Ave	Los Angeles	90004	CA	US	34.07888	-118.30937	t	["delivery"]	\N	+13238711955	\N	https://s3-media1.fl.yelpcdn.com/bphoto/RWqsSnxBmtMunpG8hqlGiA/o.jpg	3NNz-pVT_auFKzqt45D2ZA	2023-06-14 08:38:36.26316
201	TehranRo Grill	Persian	\N	5	$$	184	\N	414 S Western Ave	Los Angeles	90020	CA	US	34.0666	-118.3087	t	["delivery"]	\N	+12135294111	\N	https://s3-media2.fl.yelpcdn.com/bphoto/-0PkmqzbZ18OcHGPDdJC8g/o.jpg	WXikaEhId91eh1EAo45Ddg	2023-06-14 08:38:36.26316
202	Raffi's Place	Persian	\N	4.5	$$	5981	\N	211 E Broadway	Glendale	91205	CA	US	34.1464566	-118.2533512	t	["delivery"]	\N	+18182407411	\N	https://s3-media2.fl.yelpcdn.com/bphoto/Sm1UdPyiNr8Iu2F-K3tSvQ/o.jpg	Hd6wCJbQz81UdD_EyOumPA	2023-06-14 08:38:36.26316
203	Shekarchi Bar & Grill	Persian	\N	4.5	$$	744	\N	920 S Olive St	Los Angeles	90015	CA	US	34.042993	-118.258397	t	["pickup"]	\N	+12138928535	\N	https://s3-media2.fl.yelpcdn.com/bphoto/IMmarfmGTFD0l866DBAnhg/o.jpg	ltt8RYM6nxMfDTDM6RmrBA	2023-06-14 08:38:36.26316
204	Toranj	Persian	\N	4.5	$$	479	\N	10861 Lindbrook Dr	Los Angeles	90024	CA	US	34.06026	-118.442964	t	["pickup"]	\N	+13108248188	\N	https://s3-media4.fl.yelpcdn.com/bphoto/dOveieht5WfxgpvLKcA3Dw/o.jpg	SsQmelYytgCNxzBm0T1CCw	2023-06-14 08:38:36.26316
205	Taste of Tehran	Persian	\N	4	$$	1161	\N	1915 Westwood Blvd	Los Angeles	90025	CA	US	34.04764	-118.43542	t	["pickup"]	\N	+13104700022	\N	https://s3-media2.fl.yelpcdn.com/bphoto/nt9VB0ESyLwnoZK69mdJ2A/o.jpg	l2TpbvvizsNl-GBCRb8I1A	2023-06-14 08:38:36.26316
206	York Kabob	Persian	\N	4.5	$$	432	\N	4682 York Blvd	Los Angeles	90041	CA	US	34.122494	-118.214037	t	["pickup"]	\N	+13233447443	\N	https://s3-media4.fl.yelpcdn.com/bphoto/fKm2H47WfUmWVXhuqee16Q/o.jpg	FcRUT9viDg1V25ClpTP6VQ	2023-06-14 08:38:36.26316
207	Chell Sotoon Grill	Persian	\N	4.5	$$	217	\N	400 S San Vicente Blvd	Los Angeles	90048	CA	US	34.071427	-118.376189	t	["delivery"]	\N	+13106593242	\N	https://s3-media2.fl.yelpcdn.com/bphoto/IJGAUw26aM5_gzxH2zNPaw/o.jpg	LYVDeb2iF1DqFYc0ASXnYQ	2023-06-14 08:38:36.26316
208	Kabob By Faraj Restaurant & Kosher Meat Market	Persian	\N	4.5	$$	299	\N	8680 W Pico Blvd	Los Angeles	90035	CA	US	34.0540991	-118.3809107	t	["pickup"]	\N	+13106574447	\N	https://s3-media4.fl.yelpcdn.com/bphoto/frY0v4inqhwi_IFGiI0Mrw/o.jpg	v5_dNxHg1F5Y-h_nSeLVow	2023-06-14 08:38:36.26316
209	Jino's Pars - Persian Restaurant	Persian	\N	4	$$	627	\N	5844 W Manchester Ave	Los Angeles	90045	CA	US	33.959526	-118.384278	t	["pickup"]	\N	+13106456666	\N	https://s3-media2.fl.yelpcdn.com/bphoto/kfR9czyrUteTqJXHCRzASw/o.jpg	zFaOwOIpnv-FhVnZ93TYYg	2023-06-14 08:38:36.26316
210	Laziz Grill	Persian	\N	4.5	$$	97	\N	1896 Westwood Blvd	Los Angeles	90025	CA	US	34.04841401	-118.4354134	t	["pickup"]	\N	+13104742436	\N	https://s3-media3.fl.yelpcdn.com/bphoto/Ib6Z9L1u2uet3JrwHDMmjA/o.jpg	VWRUywup9B4dwTzhUs4MrA	2023-06-14 08:38:36.26316
211	Farsi Cafe	Persian	\N	4	$$	591	\N	1916 Westwood Blvd	Los Angeles	90025	CA	US	34.047995	-118.4349567	t	["pickup"]	\N	+13104754500	\N	https://s3-media3.fl.yelpcdn.com/bphoto/ZlQdzP6viCVbWnDIa4lg7w/o.jpg	pzO0aSiIzI8BCzuaUIabmg	2023-06-14 08:38:36.26316
212	California Kabob Kitchen	Persian	\N	4.5	$$	267	\N	141 W 11th St	Los Angeles	90015	CA	US	34.03999	-118.25899	t	["pickup"]	\N	+12137479500	\N	https://s3-media2.fl.yelpcdn.com/bphoto/Jux7687urh2IyeqZd_imEA/o.jpg	Z6_Gitnw1JV-KIJYioFtHA	2023-06-14 08:38:36.26316
213	Café Glacé	Persian	\N	4	$$	428	\N	1441 Westwood Blvd	Los Angeles	90024	CA	US	34.05447997	-118.4412863	t	["pickup"]	\N	+13104788080	\N	https://s3-media1.fl.yelpcdn.com/bphoto/4ej8Iqvr_TCt4tLwIXBlcw/o.jpg	tqSbtO_2ZYYB1-eORVwfzw	2023-06-14 08:38:36.26316
214	Kabab and More	Persian	\N	4.5	$$	134	\N	663 S Hill St	Los Angeles	90014	CA	US	34.0463373	-118.2542688	t	["pickup"]	\N	+12136210443	\N	https://s3-media3.fl.yelpcdn.com/bphoto/b_PP2gxWPkA7dSDA56LigA/o.jpg	JxUG-uHor8dwUGNfvW5MaQ	2023-06-14 08:38:36.26316
215	Naab Café	Persian	\N	4	$$	630	\N	1269 Westwood Blvd	Los Angeles	90024	CA	US	34.05726	-118.44329	t	["pickup"]	\N	+13104730303	\N	https://s3-media3.fl.yelpcdn.com/bphoto/XKw31XMYPSxw2BMhOE1p_w/o.jpg	MOeohUxfAsjOSw4d_C15dg	2023-06-14 08:38:36.26316
216	Attari Sandwich Shop	Persian	\N	4	$$	726	\N	1388 Westwood Blvd	Los Angeles	90024	CA	US	34.05544206	-118.4416082	t	["pickup"]	\N	+13104415488	\N	https://s3-media1.fl.yelpcdn.com/bphoto/V22vxAo9UDVCnsnCpKzV1Q/o.jpg	Ai2Sxk3NGbY2YKwN_swwYA	2023-06-14 08:38:36.26316
217	Shayan Express Restaurant	Persian	\N	4.5	$$	145	\N	945 S Wall St	Los Angeles	90015	CA	US	34.03795	-118.25319	t	["pickup"]	\N	+12136237000	\N	https://s3-media1.fl.yelpcdn.com/bphoto/seg7Qr0RYvBlBsskxXEN4Q/o.jpg	vtK8-BFDUBRqNlTDKkRiKg	2023-06-14 08:38:36.26316
218	Shamshiri Grill	Persian	\N	3.5	$$	1711	\N	1712 Westwood Blvd	Los Angeles	90024	CA	US	34.0515924	-118.4383808	t	["delivery"]	\N	+13104741410	\N	https://s3-media4.fl.yelpcdn.com/bphoto/TcQp7QoeIrhGodpgnGE3qw/o.jpg	YUrZwn46B-t_NRL-_eW1oQ	2023-06-14 08:38:36.26316
219	Kaban Persian Restaurant	Persian	\N	4.5	$$	186	\N	3250 Cahuenga Blvd W	Los Angeles	90068	CA	US	34.12988346	-118.3487304	t	["pickup"]	\N	+13234980080	\N	https://s3-media2.fl.yelpcdn.com/bphoto/NMhSn716jwVuXaDRPXRhZQ/o.jpg	En6b8WvIkaOZq0-NkiiWTA	2023-06-14 08:38:36.26316
220	Farid Restaurant	Persian	\N	4	$$	83	\N	635 S Broadway	Los Angeles	90014	CA	US	34.0458517	-118.2529937	t	["pickup"]	\N	+12136220808	\N	https://s3-media2.fl.yelpcdn.com/bphoto/dCrK8uvX9fBPdmRtF-CtnA/o.jpg	4MNpF8yY9moFqUbpyzulIQ	2023-06-14 08:38:36.26316
221	Grillers Mediterranean Kitchen	Persian	\N	5	$$	130	\N	425 N Brand Blvd	Glendale	91203	CA	US	34.15259	-118.25549	t	["pickup"]	\N	+18189455525	\N	https://s3-media2.fl.yelpcdn.com/bphoto/4Wu_IiPMiY19VW2xcCy39A/o.jpg	GRNSfPEDR9_4MdRnGH5fVA	2023-06-14 08:38:36.26316
222	Green Grill Mediterranean Cuisine	Persian	\N	4.5	$$	41	\N	2000 Marengo St D	Los Angeles	90033	CA	US	34.0567281	-118.2081844	t	["pickup"]	\N	+13233322252	\N	https://s3-media4.fl.yelpcdn.com/bphoto/f8vx0jM3qvDSxVxI5snT0A/o.jpg	lp1IQjCXXb0PhWD4KcCF-Q	2023-06-14 08:38:36.26316
223	Diplomat Restaurant	Persian	\N	5	$$$	25	\N	1783 Westwood Blvd	Los Angeles	90024	CA	US	34.05028	-118.43778	t	["delivery"]	\N	+13104000715	\N	https://s3-media2.fl.yelpcdn.com/bphoto/YV-0jdef-0rorMxUYQVfpA/o.jpg	F-Sd0WrHJuWAcWa6VkiT5g	2023-06-14 08:38:36.26316
224	Tehran Restaurant	Persian	\N	4	$$	212	\N	265 S Robertson Blvd	Beverly Hills	90211	CA	US	34.0630824	-118.3838809	t	["pickup"]	\N	+13108557290	\N	https://s3-media2.fl.yelpcdn.com/bphoto/sZTPM3mKk-HtF8kU_40JdA/o.jpg	9fPOWsB4FnlwAKP1-VUSRA	2023-06-14 08:38:36.26316
225	Shiraz	Persian	\N	4	$$	819	\N	211 S Glendale Ave	Glendale	91205	CA	US	34.14411	-118.24869	t	["pickup"]	\N	+18185004948	\N	https://s3-media2.fl.yelpcdn.com/bphoto/kYiVE1ZsuHRH0uW9okeqJQ/o.jpg	70vdsYbr-BWUzak9RE3YOw	2023-06-14 08:38:36.26316
226	Rosemary Grill DTLA	Persian	\N	4.5	\N	39	\N	510 W 7th	Los Angeles	90014	CA	US	34.04654	-118.25596	t	["pickup"]	\N	+18557452262	\N	https://s3-media2.fl.yelpcdn.com/bphoto/K9ESRhxE6VgXMVdkAEEAcg/o.jpg	0-NjlgMEZ8t7kNZDCd2YfA	2023-06-14 08:38:36.26316
227	Pink Orchid	Persian	\N	3.5	$$	514	\N	1927 Westwood Blvd	Los Angeles	90025	CA	US	34.04731	-118.43513	t	["pickup"]	\N	+13104414410	\N	https://s3-media1.fl.yelpcdn.com/bphoto/71GX6_uVf_zZj9Fb8vWb4w/o.jpg	c9cIJKvxsKPw1qRx_-HM1w	2023-06-14 08:38:36.26316
228	Mediterranean Delight	Persian	\N	4	$$	90	\N	726 S Hill St	Los Angeles	90014	CA	US	34.0451803	-118.2549456	t	["pickup"]	\N	+12134891660	\N	https://s3-media2.fl.yelpcdn.com/bphoto/r-z8GI9UloGDM5COeyeS_w/o.jpg	JgwivnG17XDFnMAGHUCpsw	2023-06-14 08:38:36.26316
229	Cafe Aly	Persian	\N	5	$	33	\N	310 E Pico Blvd	Los Angeles	90015	CA	US	34.0348057	-118.2579847	t	["pickup"]	\N	+12137456766	\N	https://s3-media1.fl.yelpcdn.com/bphoto/njJKMRuPRtnjLnkh_Ia20Q/o.jpg	jsAlro-yfLHx5TrET1G--A	2023-06-14 08:38:36.26316
230	Herand’s Kitchen	Persian	\N	4.5	\N	119	\N	946 N Brand Blvd	Glendale	91202	CA	US	34.16016583	-118.2547596	t	["pickup"]	\N	+18183965617	\N	https://s3-media2.fl.yelpcdn.com/bphoto/ld2JmBHjCsBccdSWaE_Jjw/o.jpg	Cq1Xcq8DBJZLdYA_pyZolw	2023-06-14 08:38:36.26316
231	Arthur's Garden	Persian	\N	4	$$	81	\N	1240 Hooper Ave	Los Angeles	90021	CA	US	34.0266113	-118.2427979	t	["delivery"]	\N	+12137457210	\N	https://s3-media3.fl.yelpcdn.com/bphoto/flIFTsfBWCOtM6osgqmGnA/o.jpg	ArhjjEbhCoEtaWyAHiBBhA	2023-06-14 08:38:36.26316
232	Moon Mart Kabab	Persian	\N	4.5	$$	201	\N	400 S Glendale Ave	Glendale	91205	CA	US	34.14153	-118.24937	t	["pickup"]	\N	+18182412314	\N	https://s3-media1.fl.yelpcdn.com/bphoto/JHtXZAyH2TNTZjXdVcYlmw/o.jpg	M_dSo9Idg2r5OTFxHp0PgQ	2023-06-14 08:38:36.26316
233	Pardis	Persian	\N	4	$$	304	\N	738 N Glendale Ave	Glendale	91206	CA	US	34.15723967	-118.2408187	t	["restaurant_reservation"]	\N	+18184848470	\N	https://s3-media1.fl.yelpcdn.com/bphoto/8JGKeZzym039c8l6VsTOjw/o.jpg	BuDHqAvNYloF-IGIxjP4lw	2023-06-14 08:38:36.26316
234	Red Fish Kitchen	Persian	\N	4	$$$$	57	\N	8879 W Pico Blvd	Los Angeles	90035	CA	US	34.05532837	-118.3852158	t	["delivery"]	\N	+13103855813	\N	https://s3-media3.fl.yelpcdn.com/bphoto/zr_0Xqk8dWQUXpbOfNpvuQ/o.jpg	ZfHO3reY56DliVYFtvDP1g	2023-06-14 08:38:36.26316
235	Nayeb Kabab	Persian	\N	4.5	$	46	\N	1300 S Los Angeles St	Los Angeles	90015	CA	US	34.0354699	-118.25933	t	["delivery"]	\N	+12137464800	\N	https://s3-media4.fl.yelpcdn.com/bphoto/fJsUFHgYn9tEL7w5ImxeLQ/o.jpg	wfPL9HN8BKwk6Q5dDzIb0Q	2023-06-14 08:38:36.26316
236	Flame Persian Cuisine	Persian	\N	3.5	$$	487	\N	1442 Westwood Blvd	Los Angeles	90024	CA	US	34.0545837	-118.4409359	t	["pickup"]	\N	+13104703399	\N	https://s3-media3.fl.yelpcdn.com/bphoto/zI_OF9V1M2Sy2HbS2IPodA/o.jpg	ZwR15di9uEs03euVPq1-pA	2023-06-14 08:38:36.26316
237	World Cafe	Persian	\N	5	$	119	\N	301 N Verdugo Rd	Glendale	91206	CA	US	34.15008545	-118.2362061	t	["pickup"]	\N	+18184848363	\N	https://s3-media2.fl.yelpcdn.com/bphoto/94Hp_9f-MaloMFaOEefz8Q/o.jpg	NZdb5Y1lP2C6hccAPZbfsw	2023-06-14 08:38:36.26316
238	Kurosh Persian Restaurant	Persian	\N	4	\N	50	\N	8560 Wilshire Blvd	Beverly Hills	90211	CA	US	34.065143	-118.378101	t	["pickup"]	\N	+13105825808	\N	https://s3-media3.fl.yelpcdn.com/bphoto/BOfuYcEHha_bxE3fLuZ2iA/o.jpg	xt0UfrleYOtIukJ1jD6S7w	2023-06-14 08:38:36.26316
239	Massis Kabob - The Original Kabobery	Persian	\N	3	$$	350	\N	10250 Santa Monica	Los Angeles	90067	CA	US	34.05789893	-118.4192835	t	["pickup"]	\N	+13105564400	\N	https://s3-media1.fl.yelpcdn.com/bphoto/KHrZFRE6oqeeHzRc8uXZHA/o.jpg	pvldEcMFvqEpQj9GvyT_hg	2023-06-14 08:38:36.26316
240	Kolah Farangi	Persian	\N	3	$$	226	\N	9180 W Pico Blvd	Los Angeles	90035	CA	US	34.054925	-118.391842	t	["pickup"]	\N	+13102744007	\N	https://s3-media2.fl.yelpcdn.com/bphoto/cbaM0zQFhFa80OVdoIS5sQ/o.jpg	sF4Yp9uv38wQxolC95jvHA	2023-06-14 08:38:36.26316
241	Shamshiri Restaurant	Persian	\N	3.5	$$	399	\N	122 W Stocker St	Glendale	91202	CA	US	34.16349627	-118.2561708	t	["pickup"]	\N	+18182469541	\N	https://s3-media3.fl.yelpcdn.com/bphoto/ki0FO_dI70cFO03EC9G7NA/o.jpg	B57MEeC3qT_cg72FTrNUOQ	2023-06-14 08:38:36.26316
242	Downtown Kabob	Persian	\N	3	$	91	\N	934 S Los Angeles St	Los Angeles	90015	CA	US	34.0399934	-118.2550822	t	["delivery"]	\N	+12136120222	\N	https://s3-media1.fl.yelpcdn.com/bphoto/sNSucS5ZBKs3uNJPJ4LQMg/o.jpg	EOe_y1xvL7vDVSsMo3pSfg	2023-06-14 08:38:36.26316
243	Sandwich 26	Persian	\N	5	$$	5	\N	305 E 9th St	Los Angeles	90015	CA	US	34.03995558	-118.2527154	t	\N	\N	\N	\N	\N	LUghlUTk1SiHNHpq10fT2A	2023-06-14 08:38:36.26316
244	Massis Kabob - The Original Kabobery	Persian	\N	3	$$	424	\N	1132 Glendale Galleria	Glendale	91210	CA	US	34.14508661	-118.2589656	t	["pickup"]	\N	+18182407375	\N	https://s3-media1.fl.yelpcdn.com/bphoto/uwujhD6eNzA9376wLh0mJQ/o.jpg	o6rF7tsd6o27Di0uLJYAaw	2023-06-14 08:38:36.26316
245	Borani Kitchen	Persian	\N	3.5	\N	3	\N	\N	Los Angeles	90004	CA	US	34.07558823	-118.2997131	t	["pickup"]	\N	+13109530040	\N	https://s3-media2.fl.yelpcdn.com/bphoto/vaV-l3JvSgRb5iRsdp_92A/o.jpg	_nqf0duMDoq8tfbVJAXHkw	2023-06-14 08:38:36.26316
246	Massis Kabob - The Original Kabobery	Persian	\N	3	$$	425	\N	14006 Riverside Dr	Sherman Oaks	91423	CA	US	34.156494	-118.437159	t	["pickup"]	\N	+18187834850	\N	https://s3-media2.fl.yelpcdn.com/bphoto/vYHORB0VLKGY2_31F2reZw/o.jpg	5QG8IRz50iscdgDi-pO56A	2023-06-14 08:38:36.26316
247	Massis Kabob - The Original Kabobery	Persian	\N	3	$$	141	\N	6000 Sepulveda Blvd	Culver City	90230	CA	US	33.98589723	-118.3926952	t	["pickup"]	\N	+13105727200	\N	https://s3-media1.fl.yelpcdn.com/bphoto/7PsvW6dWc2SmMCih2FoADw/o.jpg	1gC8p8ZEKQD1InSMQnRt5w	2023-06-14 08:38:36.26316
248	Massis Kabob - The Original Kabobery	Persian	\N	2.5	$$	106	\N	301 S Glendale Ave	Glendale	91205	CA	US	34.14232	-118.24974	t	["pickup"]	\N	+18182804420	\N	https://s3-media1.fl.yelpcdn.com/bphoto/NoAQT3FFDAv6hqnxUmitPA/o.jpg	0hnoLW5k2bjoUtr7ChiWAg	2023-06-14 08:38:36.26316
249	Sholeh	Persian	\N	2.5	$$	44	\N	1442 Westwood Blvd	Los Angeles	90024	CA	US	34.0545639	-118.4409461	t	\N	\N	+13104745105	\N	https://s3-media3.fl.yelpcdn.com/bphoto/7h7GWhoH5c5eP0od0wbqCg/o.jpg	Q_MHYVh2F9q0dNrFmchc0g	2023-06-14 08:38:36.26316
250	Ayhan Kabob	Persian	\N	5	\N	1	\N	1922 Westwood Blvd	Los Angeles	90025	CA	US	34.04775	-118.43486	t	["pickup"]	\N	+17023388067	\N	https://s3-media3.fl.yelpcdn.com/bphoto/nIo3fI4_txGvAdcEJ7mAjQ/o.jpg	pIfqVLZt4SW467cyCq1c-A	2023-06-14 08:38:36.26316
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, restaurant_id, user_id, rating, comment, photos, is_visible, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, username, profile_photo, password_hash, latitude, longitude, created_at) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuisines_id_seq', 1, false);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_id_seq', 94, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 250, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: cuisines cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: bookmarks bookmarks_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: bookmarks bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: cuisine_recipe cuisine_recipe_cuisine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_recipe
    ADD CONSTRAINT cuisine_recipe_cuisine_id_fkey FOREIGN KEY (cuisine_id) REFERENCES public.cuisines(id);


--
-- Name: cuisine_recipe cuisine_recipe_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_recipe
    ADD CONSTRAINT cuisine_recipe_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id);


--
-- Name: cuisine_restaurant cuisine_restaurant_cuisine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_restaurant
    ADD CONSTRAINT cuisine_restaurant_cuisine_id_fkey FOREIGN KEY (cuisine_id) REFERENCES public.cuisines(id);


--
-- Name: cuisine_restaurant cuisine_restaurant_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_restaurant
    ADD CONSTRAINT cuisine_restaurant_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: reviews reviews_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

