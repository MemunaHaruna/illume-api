# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: 'muna', last_name: 'haruna', email: 'mmharuna16@gmail.com',
                    unique_id: 'test', provider: 'test', avatar_url: 'test')

tags = %w(Love Life Inspirational Humor Philosophy Religion Wisdom Truth Romance Death Happiness
          Hope Faith Poetry Career Writing Success God Motivational Time Knowledge
          Spirituality Science Fashion Education Programming Technology Poverty Politics Business
          Food Art Dance Music Biology Physics Nature War Intelligence Books AI
        )

tags.each { |tag| Tag.create!(name: tag) }

quotes = [
  {
    user_id: user.id,
    content: "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
    author: 'Marilyn Monroe',
    access: 0,
    tag_ids: [8]
  },
  {
    user_id: user.id,
    content: "Be yourself; everyone else is already taken.",
    author: 'Oscar Wilde',
    access: 0,
    tag_ids: [3]
  },
  {
    user_id: user.id,
    content: "Darkness cannot drive out darkness: only light can do that. Hate cannot drive out hate: only love can do that.",
    author: 'Martin Luther King Jr.',
    source_type: 1,
    source_title: "A Testament of Hope: The Essential Writings and Speeches",
    link_to_source: "https://www.goodreads.com/book/show/53360.A_Testament_of_Hope",
    access: 0,
    tag_ids: [1, 3]
  },
  {
    user_id: user.id,
    content: "I am so clever that sometimes I don't understand a single word of what I am saying.",
    author: 'Oscar Wilde',
    source_type: 1,
    source_title: "The Happy Prince and Other Stories",
    link_to_source: "https://www.goodreads.com/book/show/779021.The_Happy_Prince_and_Other_Tales",
    access: 0,
    tag_ids: [39]
  },
  {
    user_id: user.id,
    content: "Without music, life would be a mistake.",
    author: 'Friedrich Nietzsche',
    source_type: 1,
    source_title: "Twilight of the Idols",
    link_to_source: "https://www.goodreads.com/book/show/851994.Twilight_of_the_Idols",
    access: 0,
    tag_ids: [2, 34]
  },
  {
    user_id: user.id,
    content: "We accept the love we think we deserve.",
    author: 'Stephen Chbosky',
    source_type: 1,
    source_title: "The Perks of Being a Wallflower",
    link_to_source: "https://www.goodreads.com/book/show/22628.The_Perks_of_Being_a_Wallflower",
    access: 0,
  },
  {
    user_id: user.id,
    content: "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do.",
    author: 'Rob Siltanen',
    access: 0,
  },
  {
    user_id: user.id,
    content: "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.",
    author: 'H. Jackson Brown Jr',
    source_type: 1,
    source_title: "P.S. I Love You",
    link_to_source: "https://www.goodreads.com/book/show/42165.P_S_I_Love_You",
    access: 0,
  },
  {
    user_id: user.id,
    content: "All that is gold does not glitter,
    Not all those who wander are lost;
    The old that is strong does not wither,
    Deep roots are not reached by the frost.

    From the ashes a fire shall be woken,
    A light from the shadows shall spring;
    Renewed shall be blade that was broken,
    The crownless again shall be king.",
    author: "J.R.R. Tolkien",
    source_type: 1,
    source_title: "The Fellowship of the Ring",
    link_to_source: "https://www.goodreads.com/book/show/34.The_Fellowship_of_the_Ring"
  },
  {
    user_id: user.id,
    content: "It does not do to dwell on dreams and forget to live.",
    author: 'J.K. Rowling',
    source_type: 1,
    source_title: "Harry Potter and the Sorcerer's Stone",
    link_to_source: "https://www.goodreads.com/book/show/3.Harry_Potter_and_the_Sorcerer_s_Stone",
    access: 0,
    tag_ids: [2]
  },
  {
    user_id: user.id,
    content: "As he read, I fell in love the way you fall asleep: slowly, and then all at once.",
    author: 'John Green',
    source_type: 1,
    source_title: "The Fault in Our Stars",
    link_to_source: "https://www.goodreads.com/book/show/11870085-the-fault-in-our-stars",
    access: 0,
    tag_ids: [2]
  },
  {
    user_id: user.id,
    content: "Anyone who thinks sitting in church can make you a Christian must also think that sitting in a garage can make you a car.",
    author: 'Garrison Keillor',
    access: 0,
    tag_ids: [4, 6]
  },
  {
    user_id: user.id,
    content: "Saying 'I notice you're a nerd' is like saying, 'Hey, I notice that you'd rather be intelligent than be stupid, that you'd rather be thoughtful than be vapid, that you believe that there are things that matter more than the arrest record of Lindsay Lohan. Why is that?' In fact, it seems to me that most contemporary insults are pretty lame. Even 'lame' is kind of lame. Saying 'You're lame' is like saying 'You walk with a limp.' Yeah, whatever, so does 50 Cent, and he's done all right for himself.",
    author: 'John Green',
    tag_ids: [4]
  },
  {
    user_id: user.id,
    content: "Reality continues to ruin my life.",
    author: 'Bill Watterson',
    source_type: 1,
    source_title: "The Complete Calvin and Hobbes",
    link_to_source: "https://www.goodreads.com/book/show/24812.The_Complete_Calvin_and_Hobbes",
    access: 0,
    tag_ids: [2, 4]
  },
  {
    user_id: user.id,
    content: "I'm going to make him an offer he can't refuse.",
    source_type: 2,
    source_title: "The Godfather, 1972",
    access: 0,
    tag_ids: [30]
  },
  {
    user_id: user.id,
    content: "It is a curious thing, the death of a loved one. We all know that our time in this world is limited, and that eventually all of us will end up underneath some sheet, never to wake up. And yet it is always a surprise when it happens to someone we know. It is like walking up the stairs to your bedroom in the dark, and thinking there is one more stair than there is. Your foot falls down, through the air, and there is a sickly moment of dark surprise as you try and readjust the way you thought of things.",
    author: 'Lemony Snicket',
    source_type: 1,
    source_title: "Horseradish",
    link_to_source: "https://www.goodreads.com/book/show/80678.Horseradish",
    access: 0,
    tag_ids: [10]
  },
  {
    user_id: user.id,
    content: "I'm the one that's got to die when it's time for me to die, so let me live my life the way I want to.",
    author: 'Jimi Hendrix',
    source_type: 1,
    source_title: "Jimi Hendrix - Axis: Bold as Love",
    link_to_source: "https://www.goodreads.com/book/show/11181.Jimi_Hendrix_Axis",
    access: 0,
    tag_ids: [2, 10]
  },
  {
    user_id: user.id,
    content: "A thing is not necessarily true because a man dies for it.",
    author: 'Oscar Wilde',
    access: 0,
    tag_ids: [8, 10]
  },
  {
    user_id: user.id,
    content: "I do not fear death. I had been dead for billions and billions of years before I was born, and had not suffered the slightest inconvenience from it.",
    author: 'Mark Twain',
    access: 0,
    tag_ids: [2, 10]
  },
  {
    user_id: user.id,
    content: "Life should not be a journey to the grave with the intention of arriving safely in a pretty and well preserved body, but rather to skid in broadside in a cloud of smoke, thoroughly used up, totally worn out, and loudly proclaiming 'Wow! What a Ride!'",
    author: 'Hunter S. Thompson',
    source_type: 1,
    source_title: " The Proud Highway: Saga of a Desperate Southern Gentleman, 1955-1967",
    link_to_source: "https://www.goodreads.com/book/show/10880.The_Proud_Highway",
    access: 0,
    tag_ids: [2, 10]
  },
  {
    user_id: user.id,
    content: "At my signal, unleash hell.",
    access: 0,
    source_type: 2,
    source_title: "Gladiator, 2000",
  },
  {
    user_id: user.id,
    content: "Now you're looking for the secret. But you won't find it because, of course, you're not really looking. You don't really want to work it out. You want to be fooled.",
    access: 0,
    source_type: 2,
    source_title: "The Prestige (2006)",
  },
  {
    user_id: user.id,
    content: "Want to know how I got these scars? My father was a drinker and a fiend. And one night, he goes off crazier than usual. Mommy gets the kitchen knife to defend herself. He doesn't like that. Not one bit. So, me watching, he takes the knife to her, laughing while he does it. He turns to me, and he says: 'Why so serious?' He comes at me with the knife - 'Why so serious?!' He sticks the blade in my mouth. 'Let's put a smile on that face!' And why so serious?",
    access: 0,
    source_type: 2,
    source_title: "The Dark Knight (2008)",
  },
  {
    user_id: user.id,
    content: "The important thing is not to stop questioning. Curiosity has its own reason for existence. One cannot help but be in awe when he contemplates the mysteries of eternity, of life, of the marvelous structure of reality. It is enough if one tries merely to comprehend a little of this mystery each day",
    author: 'Albert Einstein',
    source_type: 1,
    source_title: "Old Man's Advice to Youth: 'Never Lose a Holy Curiosity.' - LIFE Magazine (2 May 1955) p. 64",
    link_to_source: "https://www.goodreads.com/book/show/80678.Horseradish",
    access: 0,
    tag_ids: [23, 36]
  },
  {
    user_id: user.id,
    content: "The good thing about science is that it's true whether or not you believe in it.",
    author: 'Neil deGrasse Tyson',
    access: 0,
    tag_ids: [23]
  },
  {
    user_id: user.id,
    content: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.",
    author: 'Marie Curie',
    access: 0,
    tag_ids: [23]
  },
  {
    user_id: user.id,
    content: "A great book should leave you with many experiences, and slightly exhausted at the end. You live several lives while reading.",
    author: 'William Styron',
    source_type: 1,
    source_title: "Conversations with William Styron",
    link_to_source: "https://www.goodreads.com/book/show/11879.Conversations_with_William_Styron",
    access: 0,
    tag_ids: [40]
  },
  {
    user_id: user.id,
    content: "The books that the world calls immoral are books that show the world its own shame.",
    author: 'Oscar Wilde',
    source_type: 1,
    source_title: "The Picture of Dorian Gray",
    link_to_source: "https://www.goodreads.com/book/show/5297.The_Picture_of_Dorian_Gray",
    access: 0,
    tag_ids: [40]
  },
  {
    user_id: user.id,
    content: "A great book should leave you with many experiences, and slightly exhausted at the end. You live several lives while reading.",
    author: 'William Styron',
    source_type: 1,
    source_title: "Conversations with William Styron",
    link_to_source: "https://www.goodreads.com/book/show/11879.Conversations_with_William_Styron",
    access: 0,
    tag_ids: [40]
  },
  {
    user_id: user.id,
    content: "If there's a book that you want to read, but it hasn't been written yet, then you must write it.",
    author: 'Toni Morrison',
    access: 0,
    tag_ids: [40]
  },
  {
    user_id: user.id,
    content: "Object-oriented programming offers a sustainable way to write spaghetti code. It lets you accrete programs as a series of patches.",
    author: 'Paul Graham',
    source_type: 1,
    source_title: "Hackers & Painters: Big Ideas from the Computer Age",
    link_to_source: "https://www.goodreads.com/book/show/41793.Hackers_Painters",
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "When they first built the University of California at Irvine they just put the buildings in. They did not put any sidewalks, they just planted grass. The next year, they came back and put the sidewalks where the trails were in the grass. Perl is just that kind of language. It is not designed from first principles. Perl is those sidewalks in the grass.",
    author: 'Larry Wall',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Everyone knows that debugging is twice as hard as writing a program in the first place. So if you're as clever as you can be when you write it, how will you ever debug it?",
    author: 'Brian Kernighan',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
    author: 'Martin Fowler',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Programs must be written for people to read, and only incidentally for machines to execute.",
    author: 'Harold Abelson',
    source_type: 1,
    source_title: "Structure and Interpretation of Computer Programs",
    link_to_source: "https://www.goodreads.com/book/show/43713.Structure_and_Interpretation_of_Computer_Programs",
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "We see a lot of feature-driven product design in which the cost of features is not properly accounted. Features can have a negative value to customers because they make the products more difficult to understand and use. We are finding that people like products that just work. It turns out that designs that just work are much harder to produce that designs that assemble long lists of features.",
    author: 'Douglas Crockford',
    source_type: 1,
    source_title: "JavaScript: The Good Parts",
    link_to_source: "https://www.goodreads.com/book/show/2998152-javascript",
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Is it possible that software is not like anything else, that it is meant
    to be discarded: that the whole point is to always see it as a soap bubble?",
    author: 'Alan J Perlis',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Don't gloss over a routine or piece of code involved in the bug because you 'know' it works. Prove it. Prove it in this context, with this data, with these boundary conditions.",
    author: 'Andrew Hunt',
    source_type: 1,
    source_title: "The Pragmatic Programmer: From Journeyman to Master",
    link_to_source: "https://www.goodreads.com/book/show/4099.The_Pragmatic_Programmer",
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "The main thing I want to show in this chapter is that there is no magic involved in building your own language. I've often felt that some human inventions were so immensely clever and complicated that I'd never be able to understand them. But with a little reading and tinkering, such things often turn out to be quite mundane.",
    author: 'Marijn Haverbeke',
    source_type: 1,
    source_title: "Eloquent JavaScript: A Modern Introduction",
    link_to_source: "https://www.goodreads.com/book/show/35800771-eloquent-javascript",
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Artificial intelligence is nowhere near attaining actual sentience or awareness. And without awareness it's simply a mechanical device, which may pretend to show emotions and sentience, if it is programmed to do so, and thus it may be able to fool the humans as being alive, but in its own internal circuitry, it'd simply be following its preprogrammed tasks through the flowchart of an algorithm.",
    author: 'Abhijit Naskar',
    access: 0,
    tag_ids: [26, 41]
  },
  {
    user_id: user.id,
    content: "Emancipate yourselves from mental slavery. None but ourselves can free our minds.",
    author: 'Bob Marley',
    source_type: 3,
    source_title: "Redemption Song",
    access: 0,
    tag_ids: [7, 34]
  },
  {
    user_id: user.id,
    content: "Imagine there's no countries
    It isn't hard to do
    Nothing to kill or die for
    And no religion too
    Imagine all the people
    Living life in peace

    You may say that I'm a dreamer
    But I'm not the only one
    I hope someday you'll join us
    And the world will be as one",
    author: 'John Lennon',
    source_type: 3,
    source_title: "Imagine",
    access: 0,
    tag_ids: [6, 38]
  },
  {
    user_id: user.id,
    content: "The happiest moment i felt; is that moment when i realized my ability to create.",
    author: 'Dr. Hazem Ali',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "With software there are only two possibilites: either the users control the programme or the programme controls the users. If the programme controls the users, and the developer controls the programme, then the programme is an instrument of unjust power.",
    author: 'Richard Stallman',
    access: 0,
    tag_ids: [26]
  },
  {
    user_id: user.id,
    content: "Memories consume
    Like opening the wound
    I'm picking me apart again
    You all assume
    I'm safe here in my room
    Unless I try to start again.",
    author: 'Linkin Park',
    access: 0,
    tag_ids: [34]
  },
  {
    user_id: user.id,
    content: "I still fall on my face sometimes and I
    Can't color inside the lines 'cause
    I'm perfectly incomplete
    I'm still working on my masterpiece.",
    author: 'Jessie J.',
    access: 0,
    tag_ids: [34]
  },
  {
    user_id: user.id,
    content: "Close your eyes.
    Hear the cries.
    Oh, the screams as another one dies.
    All this pain
    For what gain?
    And the devil is telling you lies.",
    author: 'K. B. Rainwater',
    access: 0,
    tag_ids: [34]
  },
  {
    user_id: user.id,
    content: "Be students
    Be teachers
    Be politicians
    Be preachers
    Be believers
    Be astronauts
    Be champions
    Be truth seekers",
    author: 'The Script',
    access: 0,
    source_type: 3,
    source_title: "Hall of Fame",
    tag_ids: [34]
  },
  {
    user_id: user.id,
    content: "Folks are usually about as happy as they make their minds up to be.",
    author: 'Abraham Lincoln',
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "You will never be happy if you continue to search for what happiness consists of. You will never live if you are looking for the meaning of life.",
    author: 'Albert Camus',
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "Happiness is not something ready made. It comes from your own actions.",
    author: 'Dalai Lama XIV',
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "They say a person needs just three things to be truly happy in this world: someone to love, something to do, and something to hope for.",
    author: 'Tom Bodett',
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "You cannot protect yourself from sadness without protecting yourself from happiness.",
    author: 'Jonathan Safran Foer',
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "Attitude is a choice. Happiness is a choice. Optimism is a choice. Kindness is a choice. Giving is a choice. Respect is a choice. Whatever choice you make makes you. Choose wisely.",
    author: 'Roy T. Bennett',
    source_type: 1,
    source_title: "The Light in the Heart",
    link_to_source: "https://www.goodreads.com/book/show/29359991-the-light-in-the-heart",
    access: 0,
    tag_ids: [11]
  },
  {
    user_id: user.id,
    content: "For those who believe in God, most of the big questions are answered. But for those of us who can't readily accept the God formula, the big answers don't remain stone-written. We adjust to new conditions and discoveries. We are pliable. Love need not be a command nor faith a dictum. I am my own god. We are here to unlearn the teachings of the church, state, and our educational system. We are here to drink beer. We are here to kill war. We are here to laugh at the odds and live our lives so well that Death will tremble to take us.",
    author: 'Charles Bukowski',
    source_type: 1,
    source_title: "The Light in the Heart",
    link_to_source: "https://www.goodreads.com/book/show/29359991-the-light-in-the-heart",
    access: 0,
    tag_ids: [6]
  },
  {
    user_id: user.id,
    content: "Owners of dogs will have noticed that, if you provide them with food and water and shelter and affection, they will think you are god. Whereas owners of cats are compelled to realize that, if you provide them with food and water and shelter and affection, they draw the conclusion that they are gods.",
    author: 'Christopher Hitchens',
    source_type: 1,
    source_title: "The Portable Atheist: Essential Readings for the Nonbeliever",
    link_to_source: "https://www.goodreads.com/book/show/1566053.The_Portable_Atheist",
    access: 0,
    tag_ids: [6]
  },
  {
    user_id: user.id,
    content: "Forgive, O Lord, my little jokes on Thee
    And I'll forgive Thy great big one on me.",
    author: 'Robert Frost',
    access: 0,
    tag_ids: [4, 6, 14]
  },
  {
    user_id: user.id,
    content: "The easy confidence with which I know another man's religion is folly teaches me to suspect that my own is also.",
    author: 'Mark Twain',
    access: 0,
    tag_ids: [4, 6]
  },
  {
    user_id: user.id,
    content: "Thou hast made us for thyself, O Lord, and our heart is restless until it finds its rest in thee.",
    author: 'Augustine of Hippo',
    source_type: 1,
    source_title: "Confessions",
    link_to_source: "https://www.goodreads.com/book/show/27037.Confessions",
    access: 0,
    tag_ids: [6]
  },
  {
    user_id: user.id,
    content: "People, I thought, wanted security. They couldn't bear the idea of death being a big black nothing, couldn't bear the thought of their loved ones not existing, and couldn't even imagine themselves not existing. I finally decided that people believed in an afterlife because they couldn't bear not to.",
    author: 'John Green',
    source_type: 1,
    source_title: "Looking for Alaska",
    link_to_source: "https://www.goodreads.com/book/show/99561.Looking_for_Alaska",
    access: 0,
    tag_ids: [6]
  },
  {
    user_id: user.id,
    content: "I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close.",
    author: 'Pablo Neruda',
    source_type: 1,
    source_title: "100 Love Sonnets",
    link_to_source: "https://www.goodreads.com/book/show/11339.100_Love_Sonnets",
    access: 0,
    tag_ids: [1, 14]
  },
  {
    user_id: user.id,
    content: "Music expresses that which cannot be put into words and that which cannot remain silent",
    author: 'Victor hugo',
    access: 0,
    tag_ids: [14, 34]
  },
  {
    user_id: user.id,
    content: "Tell me, what is it you plan to do
    with your one wild and precious life?",
    author: 'Mary Oliver',
    access: 0,
    tag_ids: [14]
  },
  {
    user_id: user.id,
    content: "Painting is poetry that is seen rather than felt, and poetry is painting that is felt rather than seen",
    author: 'Leonardo da Vinci',
    access: 0,
    tag_ids: [14]
  },
  {
    user_id: user.id,
    content: "A poem begins as a lump in the throat, a sense of wrong, a homesickness, a lovesickness.",
    author: 'Robert Frost',
    access: 0,
    tag_ids: [14]
  },
]

quotes.each { |quote| Quote.create!(quote) }
