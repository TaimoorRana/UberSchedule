# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating courses
#
# Course.create(:course_id =>62,:dept=>'AERO', :number => 480, :credit => 3.5, :name => 'Flight Control Systems', :description => 'Basic flight control and flight dynamics principles. Aircraft dynamic equations and performance data. Implementation of aircraft control: control surfaces and their operations, development of thrust and its control; autopilot systems, their algorithms, dynamics and interaction problems. Flight instruments, principles of operation and dynamics. Cockpit layouts basic configuration, ergonomic design, control field forces; advanced concepts in instruments, avionics and displays; HUD; flight management systems, and communication equipment. Introduction to flight simulation: overview of visual, audio and motion simulator systems; advanced concepts in flight simulators.')
# Course.create(:course_id =>63,:dept=>'AERO', :number => 482, :credit => 3, :name => 'Avionic Navigation Systems', :description => 'Basics of modern electronic navigation systems, history of air navigation, earth coordinate and mapping systems; basic theory and analysis of modern electronic navigation instrumentation, communication and radar systems, approach aids, airborne systems, transmitters and antenna coverage; noise and losses, target detection, digital processing, display systems and technology; demonstration of avionic systems using flight simulator.')
# Course.create(:course_id =>66,:dept=>'COEN', :number => 320, :credit => 3, :name => 'Introduction to Real-Time Systems', :description => 'Fundamentals of real-time systems: definitions, requirements, design issues and applications. Real-time operating systems (RTOS) feature: multi-tasking, process management, scheduling, interprocess communication and synchronization, real-time memory management, clocks and timers, interrupt and exception handling, message queues, asynchronous input/output. Concurrent programming languages: design issues and examples, POSIX threads and semaphores. Introduction to real-time uniprocessor scheduling policies: static vs. dynamic, pre-emptive vs. non-pre-emptive, specific techniques â€” rate-monotonic algorithm, earliest-deadline-first, deadline monotonic, least-laxity-time-first; clock-driven scheduling. Design and specification techniques - Finite state machine based State-chart, Dataflow diagram, Petri nets. Reliability and fault-tolerance. Case studies of RTOS - QNX, VxWorks, and research prototypes.')
# Course.create(:course_id =>15,:dept=>'COMP', :number => 232, :credit => 3, :name => 'Mathematics for Computer Science', :description => 'Sets. Propositional logic and predicate calculus. Functions and relations. Elements of number theory. Proof techniques: direct proof, indirect proof, proof by contradiction, proof by induction.')
# Course.create(:course_id =>16,:dept=>'COMP', :number => 248, :credit => 3, :name => 'Object Oriented Programming I', :description => 'Introduction to programming. Basic data types, variables, expressions, assignments, control flow. Classes, objects, methods. Information hiding, public vs. private visibility, data abstraction and encapsulation. References. Arrays.')
# Course.create(:course_id =>17,:dept=>'COMP', :number => 249, :credit => 3, :name => 'Object Oriented Programming II', :description => 'Design of classes. Inheritance. Polymorphism. Static and dynamic binding. Abstract classes. Exception handling. File I/O. Recursion. Interfaces and inner classes. Graphical user interfaces. Generics. Collections and iterators. Lectures: three hours per week. ')
# Course.create(:course_id =>18,:dept=>'COMP', :number => 326, :credit => 3, :name => 'Computer Architecture', :description => 'Computer architecture models: control-flow and data-flow. Concurrency and locality, data dependency theory. Instruction level parallelism. Instruction scheduling. Pipelined processors. Vector processors. Thread level parallelism. Multiprocessors. Shared memory models. Coherence protocols. Interconnection networks. Performance issues. Advanced topics in contemporary computer architectures.')
# Course.create(:course_id =>19,:dept=>'COMP', :number => 335, :credit => 3, :name => 'Introduction to Theoretical Computer Science', :description => 'Finite state automata and regular languages. Push-down automata and context-free languages. Pumping lemmas. Applications to parsing. Turing machines. Undecidability and decidability.')
# Course.create(:course_id =>21,:dept=>'COMP', :number => 345, :credit => 3, :name => 'Advanced Program Design with C++', :description => '"Introduction to C++. I/O with stream classes. Pointers and their uses.')
# Course.create(:course_id =>22,:dept=>'COMP', :number => 346, :credit => 4, :name => 'Operating Systems', :description => 'The Standard Template Library (STL): containers, algorithms, iterators, adaptors, function objects. Class design: constructors, destructors, operator overloading, inheritance, virtual functions, exception handling, memory management. Advanced topics: libraries, locales, STL conventions, concurrency, template metaprogramming. Applications of C++: systems, engineering, games programming. Project. "')
# Course.create(:course_id =>23,:dept=>'COMP', :number => 348, :credit => 3, :name => 'Principles of Programming Languages', :description => 'Fundamentals of operating system functionalities, design and implementation. Multiprogramming: processes and threads, context switching, queuing models and scheduling. Interprocess communication and synchronization. Principles of concurrency. Synchronization primitives. Deadlock detection and recovery, prevention and avoidance schemes. Memory management. Device management. File systems. Protection models and schemes.')
# Course.create(:course_id =>24,:dept=>'COMP', :number => 352, :credit => 3, :name => 'Data Structures and Algorithms', :description => 'From requirements to design to implementation. Planned vs. evolutionary design and refactoring. Model-driven design and Unified Modelling Language (UML). Structural and behavioural design descriptions and specifications. General and domain-specific design principles, patterns and idioms. Object-oriented design concepts such as interfaces vs. abstract types, polymorphism, generics, and delegation vs. subclassing. Introduction to software architecture (styles and view models). Design quality. Design rationale. Design methodologies (e.g. based on responsibility assignment). Test-driven development.')
# Course.create(:course_id =>25,:dept=>'COMP', :number => 353, :credit => 4, :name => 'Databases', :description => 'Abstract data types: stacks and queues, trees, priority queues, dictionaries. Data structures: arrays, linked lists, heaps, hash tables, search trees. Design and analysis of algorithms: asymptotic notation, recursive algorithms, searching and sorting, tree traversal, graph algorithms.')
# Course.create(:course_id =>26,:dept=>'COMP', :number => 371, :credit => 4, :name => 'Computer Graphics', :description => 'Introduction to database management systems. Conceptual database design: the entity-relationship model. The relational data model and relational algebra: functional dependencies and normalization. The SQL language and its application in defining, querying, and updating databases; integrity constraints; triggers. Developing database applications. Other data models: Datalog. Object-oriented data model and ODL. Semi-structured data. Project.')
# Course.create(:course_id =>27,:dept=>'COMP', :number => 376, :credit => 4, :name => 'Introduction to Game Development', :description => 'Introduction to computer graphics and graphics hardware. Introduction to graphics API and graphics systems architecture. Mathematics of 2D and 3D transformations, and 2D and 3D viewing. Colour and basic rendering algorithms. Visual realism and visibility. Illumination and shading, global illumination techniques, and textures. Introduction to curves and surfaces, and 3D object modelling. Introduction to computer animation. Project.')
# Course.create(:course_id =>28,:dept=>'COMP', :number => 426, :credit => 4, :name => 'Multicore Programming', :description => 'Introduction to design and implementation aspects of computer gaming: basic game design, storytelling and narratives, and game genres. Virtual environments, 2D and 3D game engines, and game development tools. Character development, gameplay strategies, level design in games, and user interfaces. Architecture of game consoles, analog and digital controllers, and the incorporation of graphics, sound, and music in game implementations. Project.')
# Course.create(:course_id =>64,:dept=>'COMP', :number => 428, :credit => 4, :name => 'Parallel Programming', :description => 'Fundamental concepts of computer architecture. Architecture of the selected multicore platform. Review of shared-memory parallel programming. The difficulties inherent to parallel programming. Scalability of programming models. The stream programming model for multicore. Implicit and explicit threading. Implicit and explicit orchestration of data movement, both on chip and off. Adapting standard algorithms to multicore. Critical assessment of the available system-software support. Project.')
# Course.create(:course_id =>65,:dept=>'COMP', :number => 442, :credit => 4, :name => 'Compiler Design', :description => 'Parallel programming techniques as a natural extension to sequential programming. Overview of parallel programming architectures and models. Parallel programming issues: locality, granularity, scheduling, data decomposition and distribution, load balancing, communication and synchronization, determinacy and non-determinacy, cost and performance. Techniques and tools for message-passing parallel programming. Case studies. Project.')
# Course.create(:course_id =>20,:dept=>'COMP', :number => 444, :credit => 4, :name => 'System Software Design', :description => 'Compiler organization and implementation: lexical analysis and parsing, syntax-directed translation, code optimization. Run-time systems. Project.')
# Course.create(:course_id =>29,:dept=>'COMP', :number => 445, :credit => 4, :name => 'Data Communication and Computer Networks', :description => 'Detailed examination of the design, implementation and system call interface of a contemporary operating system: its kernel, file system, process and thread management including scheduling, file system design and implementation, memory management, device management, I/O management, interprocess communication and synchronization mechanisms, system call interface, interrupt handling, and other advanced issues. ')
# Course.create(:course_id =>30,:dept=>'COMP', :number => 451, :credit => 4, :name => 'Database Design', :description => 'Network architectures: OSI and Internet models. Link layer: error detection, multiple access protocols, addressing. Local area networks: Ethernet, ATM, switches and hubs. Network layer: forwarding and routing, IP, routing algorithms, multicast. Transport layer: connectionless and connection-oriented transport, reliable data transport, congestion control, QoS, UDP and TCP. Application layer: DNS, the web and http, file transfer, and email. Introduction to network security, multimedia protocols and wireless networking.')
# Course.create(:course_id =>31,:dept=>'COMP', :number => 465, :credit => 3, :name => 'Design and Analysis of Algorithms', :description => 'Storage management. Buffer management. Data organization. Index structures. Query optimization and execution. Transaction management. Recovery. Concurrency control. Database performance analysis and tuning. New trends in database technology. ')
# Course.create(:course_id =>32,:dept=>'COMP', :number => 472, :credit => 4, :name => 'Artificial Intelligence', :description => 'Order statistics: worst-case, average-case and amortized analysis. Algorithm design techniques: greedy algorithms, dynamic programming. Selected algorithms from graph theory, linear programming, number theory, string matching, and computational geometry. A survey of hard problems, NP-completeness, and approximation algorithms.')
# Course.create(:course_id =>33,:dept=>'COMP', :number => 473, :credit => 4, :name => 'Pattern Recognition', :description => 'Scope of AI. First-order logic. Automated reasoning. Search and heuristic search. Game-playing. Planning. Knowledge representation. Probabilistic reasoning. Introduction to machine learning. Introduction to natural language processing.')
# Course.create(:course_id =>34,:dept=>'COMP', :number => 474, :credit => 4, :name => 'Intelligent Systems', :description => 'Preprocessing. Feature extraction and selection. Similarity between patterns and distance measurements. Syntactic and statistical approaches. Clustering analysis. Bayesian decision theory and discriminant functions. Neural networks and machine learning. Applications. Project.')
# Course.create(:course_id =>35,:dept=>'COMP', :number => 476, :credit => 4, :name => 'Advanced Game Development', :description => 'Rule-based expert systems, blackboard architecture, and agent-based. Knowledge acquisition and representation. Uncertainty and conflict resolution. Reasoning and explanation. Design of intelligent systems. Project.')
# Course.create(:course_id =>36,:dept=>'COMP', :number => 477, :credit => 4, :name => 'Animation for Computer Games', :description => 'Introduction to advanced aspects of computer games. Game engine design. Artificial Intelligence (AI): non-player character movement, coordinated movement, pathfinding, world representations; decision making; tactical AI, strategic AI, learning in games. Physics-based techniques: collision detection and response. Networked gaming: multi-player games, networking and distributed game design, mobile gaming. Improving realism: cut scenes, 3D sound. Project.')
# Course.create(:course_id =>37,:dept=>'COMP', :number => 478, :credit => 4, :name => 'Image Processing', :description => 'Introduction to the algorithms, data structures, and techniques used in modelling and rendering dynamic scenes. Topics include principles of traditional animation, production pipeline, animation hardware and software, orientation representation and interpolation, modelling physical and articulated objects, forward and inverse kinematics, motion control and capture, key-frame, procedural, and behavioural animation, camera animation, scripting system, and free-form deformation. Project.')
# Course.create(:course_id =>38,:dept=>'COMP', :number => 479, :credit => 4, :name => 'Information Retrieval and Web Search', :description => 'Digital image fundamentals, image transforms (Fourier, Walsh, Haar, Hotelling, wavelet), image enhancement (histogram processing, spatial filtering, high- and low-pass filtering), image restoration, image compression (elements of information theory, image compression models, error-free compression, lossy compression, image compression standards), image segmentation (line detection, Hough transform, edge detection and linking, thresholding, region splitting and merging), representation and description (chain codes, signatures, skeletons, shape descriptors, moments, texture). Project.')
# Course.create(:course_id =>39,:dept=>'COMP', :number => 490, :credit => 4, :name => 'Computer Science Project I', :description => 'Basics of information retrieval (IR): boolean, vector space and probabilistic models. Tokenization and creation of inverted files. Weighting schemes. Evaluation of IR systems: precision, recall, F-measure. Relevance feedback and query expansion. Application of IR to web search engines: XML, link analysis, PageRank algorithm. Text categorization and clustering techniques as used in spam filtering. Project.')
# Course.create(:course_id =>40,:dept=>'COMP', :number => 492, :credit => 3, :name => 'Computer Science Project II', :description => 'Students work on a computer science project under the supervision of a faculty member and submit a suitable written report on the work carried out.')
# Course.create(:course_id =>67,:dept=>'ELEC', :number => 275, :credit => 3.5, :name => 'Principles of Electrical Engineering', :description => 'Students work on a computer science project under the supervision of a faculty member and submit a suitable written report on the work carried out.')
# Course.create(:course_id =>13,:dept=>'ENCS', :number => 272, :credit => 3, :name => 'Composition and Argumentation for Engineers', :description => 'Fundamentals of electric circuits: Kirchoffâ€™s laws, voltage and current sources, Ohmâ€™s law, series and parallel circuits. Nodal and mesh analysis of DC circuits. Superposition theorem, Thevenin and Norton Equivalents. Use of operational amplifiers. Transient analysis of simple RC, RL and RLC circuits. Steady state analysis: Phasors and impedances, power and power factor. Single and three phase circuits. Magnetic circuits and transformers. Power generation and distribution.')
# Course.create(:course_id =>14,:dept=>'ENCS', :number => 282, :credit => 3, :name => 'Technical Writing and Communication', :description => 'Fundamentals of English composition and argumentation: grammar; reasoning and persuasion; persuasive proofs; argumentation; structuring and outlining; the problem statement; the body; and the conclusions. Language and persuasion for effective communication in professional engineering. Cultivation of a writing style firmly based on clear and critical thinking skills.')
# Course.create(:course_id =>1,:dept=>'ENGR', :number => 201, :credit => 1.5, :name => 'Professional Practice and Responsibility', :description => 'Technical writing form and style. Technical and scientific papers, abstracts, reports. Library research and referencing methods for engineers and computer scientists. Technical communication using information technology: document processing software, computer-assisted presentation, analysis and design of web presentation, choice and use of appropriate tools. Students will prepare an individual major report and make an oral presentation.')
# Course.create(:course_id =>2,:dept=>'ENGR', :number => 202, :credit => 1.5, :name => 'Sustainable Development and Environmental Stewardship', :description => 'Health and safety issues for engineering projects: Quebec and Canadian legislation; safe work practices; general laboratory safety common to all engineering disciplines, and specific laboratory safety pertaining to particular engineering disciplines. Review of the legal framework in Quebec, particularly the Professional Code and the Engineers Act, as well as professional ethics.')
# Course.create(:course_id =>3,:dept=>'ENGR', :number => 213, :credit => 3, :name => 'Applied Ordinary Differential Equations', :description => 'Introduction to the concept of sustainable development and the approaches for achieving it. Relationships with economic, social, and technological development. Methods for evaluating sustainability of engineering projects, including utilization of relevant databases and software. Impact of engineering design and industrial development on the environment. Case studies. Lectures: one and a half hours per week.')
# Course.create(:course_id =>4,:dept=>'ENGR', :number => 233, :credit => 3, :name => 'Applied Advanced Calculus', :description => 'This course introduces Engineering students to the theory and application of ordinary differential equations. Definition and terminology, initial-value problems, separable differential equations, linear equations, exact equations, solutions by substitution, linear models, orthogonal trajectories, complex numbers, form of complex numbers: powers and roots, theory: linear equations, homogeneous linear equations with constant coefficients, undetermined coefficients, variation of parameters, Cauchy-Euler equation, reduction of order, linear models: initial value, review of power series, power series solutions, theory, homogeneous linear systems, solution by diagonalisation, non-homogeneous linear systems. Eigenvalues and eigenvectors.')
# Course.create(:course_id =>5,:dept=>'ENGR', :number => 242, :credit => 3, :name => 'Statics', :description => 'This course introduces Engineering students to the theory and application of advanced calculus. Functions of several variables, partial derivatives, total and exact differentials, approximations with differentials. Tangent plane and normal line to a surface, directional derivatives, gradient. Double and triple integrals. Polar, cylindrical, and spherical coordinates. Change of variables in double and triple integrals. Vector differential calculus; divergence, curl, curvature, line integrals, Greenâ€™s theorem, surface integrals, divergence theorem, applications of divergence theorem, Stokesâ€™ theorem.')
# Course.create(:course_id =>6,:dept=>'ENGR', :number => 243, :credit => 3, :name => 'Dynamics', :description => 'Resultant of force systems; equilibrium of particles and rigid bodies; distributed forces; statically determinate systems; trusses; friction; moments of inertia; virtual work. Shear and bending moment diagrams. ')
# Course.create(:course_id =>7,:dept=>'ENGR', :number => 244, :credit => 3, :name => 'Mechanics of Materials', :description => 'Kinematics of a particle and rigid body; forces and accelerations; work and energy; impulse and momentum; dynamics of a system of particles and rigid bodies, introduction to vibrations.')
# Course.create(:course_id =>8,:dept=>'ENGR', :number => 245, :credit => 3, :name => 'Thermodynamics', :description => 'Mechanical behaviour of materials; stress; strain; shear and bending moment diagrams; introduction to inelastic action. Analysis and design of structural and machine elements subjected to axial, torsional, and flexural loadings. Combined stresses and stress transformation. Deflections. Introduction to elastic stability.')
# Course.create(:course_id =>9,:dept=>'ENGR', :number => 301, :credit => 3, :name => 'Engineering Management Principles and Economics', :description => 'Basic principles of thermodynamics and their application to various systems composed of pure substances and their homogeneous non-reactive mixtures. Simple power production and utilization cycles.')
# Course.create(:course_id =>10,:dept=>'ENGR', :number => 371, :credit => 3, :name => 'Probability and Statistics in Engineering', :description => 'Introduction to project delivery systems. Principles of project management; role and activity of a manager; enterprise organizational charts; cost estimating; planning and control. Company finances; interest and time value of money; discounted cash flow; evaluation of projects in private and public sectors; depreciation methods; business tax regulations; decision tree; sensitivity analysis.')
# Course.create(:course_id =>11,:dept=>'ENGR', :number => 391, :credit => 3, :name => 'Numerical Methods in Engineering', :description => 'Axioms of probability theory. Events. Conditional probability. Bayes theorem. Random variables. Mathematical expectation. Discrete and continuous probability density functions. Transformation of variables. Probabilistic models, statistics, and elements of hypothesis testing (sampling distributions and interval estimation). Introduction to statistical quality control. Applications to engineering problems.')
# Course.create(:course_id =>12,:dept=>'ENGR', :number => 392, :credit => 3, :name => 'Impact of Technology on Society', :description => 'Roots of algebraic and transcendental equations; function approximation; numerical differentiation; numerical integration; solution of simultaneous algebraic equations; numerical integration of ordinary differential equations.')
# Course.create(:course_id =>41,:dept=>'SOEN', :number => 228, :credit => 4, :name => 'System Hardware', :description => 'Social history of technology and of science including the industrial revolution and modern times. Engineering and scientific creativity, social and environmental problems created by uncontrolled technology, appropriate technology.')
# Course.create(:course_id =>42,:dept=>'SOEN', :number => 287, :credit => 3, :name => 'Web Programming', :description => 'Processor structure, Data and Instructions, Instruction Set Processor (ISP) level view of computer hardware, assembly language level use. Memory systems â€” RAM and disks, hierarchy of memories. I/O organization, I/O devices and their diversity, their interconnection to CPU and Memory. Communication between computers at the physical level. Networks and computers.')
# Course.create(:course_id =>43,:dept=>'SOEN', :number => 321, :credit => 3, :name => 'Information Systems Security', :description => 'Internet architecture and protocols. Web applications through clients and servers. Markup languages. Client-side programming using scripting languages. Static website contents and dynamic page generation through server-side programming. Preserving state (client-side) in web applications.')
# Course.create(:course_id =>44,:dept=>'SOEN', :number => 331, :credit => 3, :name => 'Introduction to Formal Methods for Software Engineering', :description => 'Protocol layers and security protocols. Intranets and extranets. Mobile computing. Electronic commerce. Security architectures in open-network environments. Cryptographic security protocols. Threats, attacks, and vulnerabilities. Security services: confidentiality; authentication; integrity; access control; non-repudiation; and availability. Security mechanisms: encryption; data-integrity mechanisms; digital signatures; keyed hashes; access-control mechanisms; challenge-response authentication; traffic padding; routing control; and notarization. Key-management principles. Distributed and embedded firewalls. Security zones.')
# Course.create(:course_id =>45,:dept=>'SOEN', :number => 341, :credit => 3, :name => 'Software Process', :description => 'Assertions. Static and dynamic checking. Method specification using preconditions and postconditions. Strengthening and weakening. Design by contract. Hoare logic. Invariants. Class specification using invariants. Software tools for assertion checking and verification. Reliable software development.')
# Course.create(:course_id =>46,:dept=>'SOEN', :number => 342, :credit => 3, :name => 'Software Requirements and Specifications', :description => 'Basic principles of software engineering. Introduction to software process models. Activities in each phase, including review activities. Working in teams: organization; stages of formation; roles; conflict resolution. Notations used in software documentation. How to review, revise, and improve software documentation,')
# Course.create(:course_id =>47,:dept=>'SOEN', :number => 343, :credit => 3, :name => 'Software Architecture and Design I', :description => 'Requirements engineering. Functional and non-functional requirements. Traceability. Test generation. Formal and informal specifications. Formal specification languages. Reasoning with specifications. Correctness issues. Verification.')
# Course.create(:course_id =>48,:dept=>'SOEN', :number => 344, :credit => 3, :name => 'Software Architecture and Design II', :description => 'From requirements to design to implementation. Planned vs. evolutionary design and refactoring. Model-driven design and Unified Modelling Language (UML). Structural and behavioural design descriptions and specifications. General and domain-specific design principles, patterns and idioms. Object-oriented design concepts such as interfaces vs. abstract types, polymorphism, generics, and delegation vs. subclassing. Introduction to software architecture (styles and view models). Design quality. Design rationale. Design methodologies (e.g. based on responsibility assignment). Test-driven development.')
# Course.create(:course_id =>49,:dept=>'SOEN', :number => 345, :credit => 3, :name => 'Software Testing, Verification and Quality Assurance', :description => 'Architectural activities, roles, and deliverables. Architectural view models. Architectural styles (including client-server, layered, pipes and filters, event-based, process control) and frameworks. Architectural analysis and the interplay with requirements elicitation. Notations for expressing architectural designs, structural and behavioural specifications. From architectural design to detailed design. Domain specific architectures and design patterns. Evaluation and performance estimation of designs. Advanced object-oriented design patterns and idioms.')
# Course.create(:course_id =>50,:dept=>'SOEN', :number => 357, :credit => 3, :name => 'User Interface Design', :description => 'Testing strategies. Specification-based vs. code-based, black-box vs. white-box, functional vs. structural testing; unit, integration, system, acceptance, and regression testing. Verification vs. validation. Test planning, design and artifacts. Introduction to software reliability and quality assurance. Formal verification methods, oracles; static and dynamic program verification.')
# Course.create(:course_id =>51,:dept=>'SOEN', :number => 384, :credit => 3, :name => 'Management, Measurement and Quality Control', :description => 'The human side: I/O; memory; and information processing. Interaction: mental models; human error; interaction frameworks and paradigms. Direct manipulation. User interface design: principles; standards; and guidelines. User-centred design: standards and design rationale; heuristic evaluation; iterative design; and prototyping. Task-centred design. Rationalized design: usability engineering; dialogue notations; user models; diagrammatic notations; and textual notations. Evaluation: with the user; without the user; quantitative; and qualitative. Implementation support. Help and documentation.')
# Course.create(:course_id =>52,:dept=>'SOEN', :number => 385, :credit => 3, :name => 'Control Systems and Applications', :description => 'Organization of large software development. Roles of team members, leaders, managers, stakeholders, and users. Tools for monitoring and controlling a schedule. Financial, organizational, human, and computational resources allocation and control. Project and quality reviews, inspections, and walkthroughs. Risk management. Communication and collaboration. Cause and effects of project failure. Project management via the Internet. Quality assurance and control.')
# Course.create(:course_id =>53,:dept=>'SOEN', :number => 387, :credit => 3, :name => 'Web-Based Enterprise Application Design', :description => 'Mathematical modelling of dynamical systems; block diagrams; feedback; open and closed loops. Linear differential equations; time domain analysis; free, forced, and total response; steady state and transient response. Laplace transform and inverse transform; second order systems. Transfer functions and stability. Control system design: PID and root locus techniques. Computer simulation of control systems. Applications.')
# Course.create(:course_id =>54,:dept=>'SOEN', :number => 390, :credit => 3.5, :name => 'Software Engineering Team Design Project', :description => 'Hypertext Transfer Protocol (HTTP), web mark-up languages and encodings. Document Object Models (DOM). Client/server and layered architectures for Web-based Enterprise Applications (WEA). Presentation, Domain and Data Source design patterns. Client-side programming. Java servlets and Java Server Pages. Authentication, security and transaction processing.')
# Course.create(:course_id =>55,:dept=>'SOEN', :number => 422, :credit => 4, :name => 'Embedded Systems and Software', :description => 'Students work in teams to design and implement a software project from requirements provided by the coordinator. Each team will demonstrate the software and prepare adequate documentation for it. In addition, each student will write an individual report.')
# Course.create(:course_id =>56,:dept=>'SOEN', :number => 423, :credit => 4, :name => 'Distributed Systems', :description => 'Characteristics of embedded systems. Microcontroller architectures and their software. Development environments. Operating system configuration. Interprocessor and remote communication. Interface, timer and interrupt configuration. Control of physical systems. Design, implementation and testing of integrated systems. Advanced topics. Lectures: three hours per week.')
# Course.create(:course_id =>57,:dept=>'SOEN', :number => 448, :credit => 3, :name => 'Management of Evolving Systems', :description => 'Principles of distributed computing: scalability, transparency, concurrency, consistency, fault tolerance, high availability. Client-server interaction technologies: interprocess communication, sockets, group communication, remote procedure call, remote method invocation, object request broker, CORBA, web services. Server design techniques: process replication, fault tolerance through passive replication, high availability through active replication, coordination and agreement, transactions and concurrency control.')
# Course.create(:course_id =>58,:dept=>'SOEN', :number => 449, :credit => 3, :name => 'Component Engineering', :description => 'Software maintenance: corrective; perfective; and adaptive. Software reuse; construction of reusable software. Techniques for reverse engineering and re-engineering software. Software development as "growing" software. Long-term evolution of software systems. Legacy systems.')
# Course.create(:course_id =>59,:dept=>'SOEN', :number => 487, :credit => 4, :name => 'Web Services and Applications', :description => 'Review of high-level language concepts and abstraction mechanisms. Programming with functional and logical languages. Typed vs. untyped languages. The use of scripting languages and other language-based techniques to assemble systems from high-level components.')
# Course.create(:course_id =>60,:dept=>'SOEN', :number => 490, :credit => 4, :name => 'Capstone Software Engineering Design Project ', :description => 'Analysis and design of web services and applications. Advanced architectures for the design, deployment, and testing of large multi-server web services and applications. Service Oriented Architecture (SOA). Electronic Commerce. Security. Load balancing. Stress testing.')
# Course.create(:course_id =>61,:dept=>'SOEN', :number => 491, :credit => 1, :name => 'Software Engineering Project', :description => 'Students work in teams of between six and nine members to construct a significant software application. The class meets at regular intervals. Team members will give a presentation of their contribution to the project.')
#
#
# # Creating Course Sections
#
# Section.create(id:1,course_id:1,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'BASSEL ATALLAH',day_of_week:'M-WW-----',term:'Summer')
# Section.create(id:2,course_id:1,name:'G', time_start: '16:15',time_end:'17:30', instructor:'REMI ALAURENT',day_of_week:'-T-----',term:'Fall')
# Section.create(id:3,course_id:1,name:'H', time_start: '16:15',time_end:'17:30', instructor:'REMI ALAURENT',day_of_week:'---J---',term:'Fall')
# Section.create(id:4,course_id:1,name:'Q', time_start: '16:15',time_end:'17:30', instructor:'REMI ALAURENT',day_of_week:'-T-----',term:'Winter')
# Section.create(id:5,course_id:2,name:'AA', time_start: '11:45',time_end:'13:00', instructor:'JOHN HADJINICOLAOU',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:6,course_id:2,name:'G', time_start: '16:15',time_end:'17:30', instructor:'JOHN HADJINICOLAOU',day_of_week:'----F--',term:'Fall')
# Section.create(id:7,course_id:2,name:'H', time_start: '16:15',time_end:'17:30', instructor:'JOHN HADJINICOLAOU',day_of_week:'---J---',term:'Fall')
# Section.create(id:8,course_id:2,name:'R', time_start: '16:15',time_end:'17:30', instructor:'JOHN HADJINICOLAOU',day_of_week:'---J---',term:'Winter')
# Section.create(id:9,course_id:2,name:'SS', time_start: '17:45',time_end:'19:00', instructor:'RAHIM TADAYON',day_of_week:'--W----',term:'Winter')
# Section.create(id:10,course_id:3,name:'AA', time_start: '10:15',time_end:'12:45', instructor:'ALEXANDRE PARADIS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:11,course_id:3,name:'P', time_start: '11:45',time_end:'13:00', instructor:'DIMITER DRYANOV',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:12,course_id:3,name:'R', time_start: '8:45',time_end:'10:00', instructor:'NATALIIA ROSSOKHATA',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:13,course_id:3,name:'T', time_start: '10:15',time_end:'11:30', instructor:'GEORGIOS VATISTAS',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:14,course_id:3,name:'U', time_start: '11:45',time_end:'13:00', instructor:'ALEXEY KOKOTOV',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:15,course_id:3,name:'V', time_start: '8:45',time_end:'10:00', instructor:'CIPRIAN ALECSANDRU',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:16,course_id:3,name:'X', time_start: '10:15',time_end:'11:30', instructor:'DMITRY KOROTKIN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:17,course_id:3,name:'XX', time_start: '17:45',time_end:'20:15', instructor:'DIMITER DRYANOV',day_of_week:'----F--',term:'Fall')
# Section.create(id:18,course_id:3,name:'F', time_start: '14:45',time_end:'16:00', instructor:'NATALIIA ROSSOKHATA',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:19,course_id:3,name:'G', time_start: '14:45',time_end:'16:00', instructor:'M. OMAIR AHMAD',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:20,course_id:3,name:'J', time_start: '14:45',time_end:'16:00', instructor:'ALEXEY KOKOTOV',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:21,course_id:4,name:'CC', time_start: '10:45',time_end:'13:15', instructor:'DONALD DAVIS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:22,course_id:4,name:'P', time_start: '13:15',time_end:'14:30', instructor:'RAMA BHAT',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:23,course_id:4,name:'Q', time_start: '13:15',time_end:'14:30', instructor:'DMITRY KOROTKIN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:24,course_id:4,name:'J', time_start: '16:15',time_end:'17:30', instructor:'DIMITER DRYANOV',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:25,course_id:4,name:'R', time_start: '11:45',time_end:'13:00', instructor:'ALEXANDER SHNIRELMAN',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:26,course_id:4,name:'S', time_start: '8:45',time_end:'10:00', instructor:'CHANTAL DAVID',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:27,course_id:4,name:'T', time_start: '10:15',time_end:'11:30', instructor:'IMAN GOHAR',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:28,course_id:4,name:'U', time_start: '8:45',time_end:'10:00', instructor:'ALEXANDER SHNIRELMAN',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:29,course_id:4,name:'V', time_start: '8:45',time_end:'10:00', instructor:'HASHEM AKBARI',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:30,course_id:4,name:'X', time_start: '10:15',time_end:'11:30', instructor:'CHANTAL DAVID',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:31,course_id:5,name:'T', time_start: '10:15',time_end:'11:30', instructor:'ALEXANDRE PARADIS',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:32,course_id:5,name:'V', time_start: '10:15',time_end:'11:30', instructor:'THEODORE STATHOPOULOS',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:33,course_id:5,name:'X', time_start: '10:15',time_end:'11:30', instructor:'JAVAD DARGAHI',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:34,course_id:5,name:'YY', time_start: '17:45',time_end:'20:15', instructor:'CHELLAIYAH RAJALINGHAM',day_of_week:'-T-----',term:'Fall')
# Section.create(id:35,course_id:5,name:'J', time_start: '11:45',time_end:'13:00', instructor:'THEODORE STATHOPOULOS',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:36,course_id:5,name:'L', time_start: '11:45',time_end:'13:00', instructor:'CHELLAIYAH RAJALINGHAM',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:37,course_id:6,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'ALEXANDRE PARADIS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:38,course_id:6,name:'T', time_start: '11:45',time_end:'13:00', instructor:'RAMA BHAT',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:39,course_id:6,name:'V', time_start: '10:15',time_end:'11:30', instructor:'THEODORE STATHOPOULOS',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:40,course_id:6,name:'X', time_start: '11:45',time_end:'13:00', instructor:'ASHOK KAUSHAL',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:41,course_id:6,name:'TT', time_start: '17:45',time_end:'20:15', instructor:'ALEXANDRE PARADIS',day_of_week:'---J---',term:'Winter')
# Section.create(id:42,course_id:7,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'RAJAMOHAN GANESAN',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:43,course_id:7,name:'AB', time_start: '18:30',time_end:'21:00', instructor:'WAIZUDDIN AHMED',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:44,course_id:7,name:'M', time_start: '13:15',time_end:'14:30', instructor:'SURAJ JOSHI',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:45,course_id:7,name:'T', time_start: '13:15',time_end:'14:30', instructor:'WAIZUDDIN AHMED',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:46,course_id:7,name:'V', time_start: '8:45',time_end:'10:00', instructor:'CHELLAIYAH RAJALINGHAM',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:47,course_id:7,name:'X', time_start: '13:15',time_end:'14:30', instructor:'CHELLAIYAH RAJALINGHAM',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:48,course_id:7,name:'LL', time_start: '17:45',time_end:'20:15', instructor:'MICHELLE NOKKEN',day_of_week:'--W----',term:'Winter')
# Section.create(id:49,course_id:8,name:'V', time_start: '13:15',time_end:'14:30', instructor:'DACIAN EMILIAN ROMAN',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:50,course_id:8,name:'CV', time_start: '15:45',time_end:'18:15', instructor:'PIERRE GAUTHIER',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:51,course_id:8,name:'M', time_start: '16:15',time_end:'17:30', instructor:'HOI DICK NG',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:52,course_id:8,name:'T', time_start: '10:15',time_end:'11:30', instructor:'LYES KADEM',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:53,course_id:8,name:'T', time_start: '8:45',time_end:'10:00', instructor:'ALEXANDRE PARADIS',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:54,course_id:8,name:'V', time_start: '10:15',time_end:'11:30', instructor:'HASHEM AKBARI',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:55,course_id:8,name:'XX', time_start: '17:45',time_end:'20:15', instructor:'CHELLAIYAH RAJALINGHAM',day_of_week:'----F--',term:'Winter')
# Section.create(id:56,course_id:8,name:'F', time_start: '16:15',time_end:'17:30', instructor:'KRZYSZTOF SKONIECZNY',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:57,course_id:8,name:'U', time_start: '10:15',time_end:'11:30', instructor:'LUIS RODRIGUES',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:58,course_id:9,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'SHAHRAM SHARIFI',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:59,course_id:9,name:'AB', time_start: '18:30',time_end:'21:00', instructor:'SALEH AHMAD ABU DABOUS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:60,course_id:9,name:'G', time_start: '16:15',time_end:'17:30', instructor:'GERARD GOUW',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:61,course_id:9,name:'H', time_start: '16:15',time_end:'17:30', instructor:'FUZHAN NASIRI',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:62,course_id:9,name:'FF', time_start: '17:45',time_end:'20:15', instructor:'JIAN LI HAO',day_of_week:'----F--',term:'Fall')
# Section.create(id:63,course_id:9,name:'II', time_start: '17:45',time_end:'20:15', instructor:'SHAHRAM SHARIFI',day_of_week:'----F--',term:'Fall')
# Section.create(id:64,course_id:9,name:'R', time_start: '16:15',time_end:'17:30', instructor:'JIAN LI HAO',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:65,course_id:9,name:'SS', time_start: '17:45',time_end:'20:15', instructor:'GERARD GOUW',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:66,course_id:9,name:'AA', time_start: '11:45',time_end:'14:30', instructor:'DONALD DAVIS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:67,course_id:9,name:'AB', time_start: '18:30',time_end:'21:00', instructor:'SURAJ JOSHI',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:68,course_id:9,name:'T', time_start: '16:15',time_end:'17:30', instructor:'NABIL ESMAIL',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:69,course_id:9,name:'X', time_start: '8:45',time_end:'10:00', instructor:'ZHI LI',day_of_week:'--W-F--',term:'all')
# Section.create(id:70,course_id:9,name:'Y', time_start: '16:15',time_end:'17:30', instructor:'ALEXANDRE PARADIS',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:71,course_id:9,name:'AA', time_start: '14:45',time_end:'17:30', instructor:'MARIUS PARASCHIVOIU',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:72,course_id:9,name:'L', time_start: '8:45',time_end:'10:00', instructor:'CHARLES KIYANDA',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:73,course_id:9,name:'V', time_start: '11:45',time_end:'13:00', instructor:'LIANGZHU WANG',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:74,course_id:9,name:'X', time_start: '13:15',time_end:'14:30', instructor:'MARIUS PARASCHIVOIU',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:75,course_id:10,name:'CC', time_start: '18:30',time_end:'21:00', instructor:'DONALD DAVIS',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:76,course_id:10,name:'CD', time_start: '18:30',time_end:'21:00', instructor:'SHAHRAM SHARIFI',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:77,course_id:10,name:'R', time_start: '13:15',time_end:'14:30', instructor:'SURAJ JOSHI',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:78,course_id:10,name:'S', time_start: '13:15',time_end:'14:30', instructor:'KETRA SCHMITT',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:79,course_id:10,name:'FF', time_start: '17:45',time_end:'20:15', instructor:'WALAA HAMOUDA',day_of_week:'M-WW-----',term:'Fall')
# Section.create(id:80,course_id:10,name:'T', time_start: '14:45',time_end:'16:00', instructor:'JOHN XIUPU ZHANG',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:81,course_id:10,name:'W', time_start: '10:15',time_end:'11:30', instructor:'HASSAN RIVAZ',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:82,course_id:10,name:'UU', time_start: '17:45',time_end:'20:15', instructor:'IMAN GOHAR',day_of_week:'----F--',term:'Winter')
# Section.create(id:83,course_id:11,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'CHANDRA ASTHANA',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:84,course_id:11,name:'CC', time_start: '18:30',time_end:'21:00', instructor:'PIERRE GAUTHIER',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:85,course_id:11,name:'F', time_start: '16:15',time_end:'17:30', instructor:'RAMA BHAT',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:86,course_id:11,name:'M', time_start: '8:45',time_end:'10:00', instructor:'ASHOK KAUSHAL',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:87,course_id:11,name:'S', time_start: '16:15',time_end:'17:30', instructor:'ASHOK KAUSHAL',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:88,course_id:11,name:'V', time_start: '13:15',time_end:'14:30', instructor:'LIANGZHU WANG',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:89,course_id:11,name:'X', time_start: '8:45',time_end:'10:00', instructor:'ASHOK KAUSHAL',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:90,course_id:11,name:'UU', time_start: '17:45',time_end:'20:15', instructor:'CHARLES KIYANDA',day_of_week:'---J---',term:'Winter')
# Section.create(id:91,course_id:12,name:'AA', time_start: '8:45',time_end:'11:30', instructor:'PIERRE OUELLET',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:92,course_id:12,name:'AB', time_start: '11:45',time_end:'14:30', instructor:'DAVID SADOWAY',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:93,course_id:12,name:'CC', time_start: '8:45',time_end:'11:30', instructor:'BRUNO GRENIER',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:94,course_id:12,name:'D', time_start: '8:45',time_end:'11:30', instructor:'BRUNO GRENIER',day_of_week:'----F--',term:'Fall')
# Section.create(id:95,course_id:12,name:'F', time_start: '16:15',time_end:'17:30', instructor:'BRANDIFF CARON',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:96,course_id:12,name:'EE', time_start: '17:45',time_end:'20:15', instructor:'BRUNO GRENIER',day_of_week:'---J---',term:'Fall')
# Section.create(id:97,course_id:12,name:'P', time_start: '8:45',time_end:'11:30', instructor:'KERRY HOLDEN',day_of_week:'----F--',term:'Winter')
# Section.create(id:98,course_id:12,name:'Q', time_start: '16:15',time_end:'17:30', instructor:'MATTHEW HARSH',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:99,course_id:12,name:'RR', time_start: '17:45',time_end:'20:15', instructor:'MATTHEW HARSH',day_of_week:'-T-----',term:'Winter')
# Section.create(id:100,course_id:12,name:'W', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Summer')
# Section.create(id:101,course_id:12,name:'BB', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Summer')
# Section.create(id:102,course_id:12,name:'F', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Fall')
# Section.create(id:103,course_id:12,name:'W', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Winter')
# Section.create(id:104,course_id:12,name:'X', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Winter')
# Section.create(id:105,course_id:12,name:'BM', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Summer')
# Section.create(id:106,course_id:12,name:'MI', time_start: '0:00',time_end:'0:00', instructor:'DEBORAH DYSART-GALE',day_of_week:'-------',term:'Winter')
# Section.create(id:107,course_id:12,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'STANISLAS L KLASA',day_of_week:'-T-----',term:'Fall')
# Section.create(id:108,course_id:12,name:'QQ', time_start: '17:45',time_end:'20:15', instructor:'STANISLAS L KLASA',day_of_week:'-T-----',term:'Winter')
# Section.create(id:109,course_id:12,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'TADEUSZ OBUCHOWICZ',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:110,course_id:12,name:'U', time_start: '13:15',time_end:'14:30', instructor:'KERLY TITUS',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:111,course_id:12,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'DAVID PROBST',day_of_week:'--W----',term:'Winter')
# Section.create(id:112,course_id:12,name:'PP', time_start: '17:45',time_end:'20:15', instructor:'DAVID PROBST',day_of_week:'-T-----',term:'Winter')
# Section.create(id:113,course_id:15,name:'AA', time_start: '10:45',time_end:'13:15', instructor:'VACLAV KRATOCHVIL',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:114,course_id:15,name:'Q', time_start: '13:15',time_end:'14:30', instructor:'GOSTA GRAHNE',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:115,course_id:15,name:'R', time_start: '13:15',time_end:'14:30', instructor:'LATA NARAYANAN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:116,course_id:15,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'EUSEBIUS DOEDEL',day_of_week:'--W----',term:'Fall')
# Section.create(id:117,course_id:15,name:'S', time_start: '13:15',time_end:'14:30', instructor:'SABINE BERGLER',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:118,course_id:15,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'GOSTA GRAHNE',day_of_week:'---J---',term:'Winter')
# Section.create(id:119,course_id:15,name:'CC', time_start: '13:15',time_end:'16:00', instructor:'CARLOS-LUIS SANTANA',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:120,course_id:15,name:'Q', time_start: '13:15',time_end:'14:30', instructor:'SUDHIR MUDUR',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:121,course_id:15,name:'N', time_start: '13:15',time_end:'14:30', instructor:'EUSEBIUS DOEDEL',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:122,course_id:15,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'ADAM KRZYZAK',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:123,course_id:16,name:'AA', time_start: '13:30',time_end:'16:00', instructor:'LEILA KOSSEIM',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:124,course_id:16,name:'Q', time_start: '13:15',time_end:'14:30', instructor:'EMAD SHIHAB',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:125,course_id:16,name:'R', time_start: '8:45',time_end:'10:00', instructor:'NANCY ACEMIAN',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:126,course_id:16,name:'EE', time_start: '17:45',time_end:'20:15', instructor:'LEILA KOSSEIM',day_of_week:'----F--',term:'Fall')
# Section.create(id:127,course_id:16,name:'U', time_start: '10:15',time_end:'11:30', instructor:'AIMAN HANNA',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:128,course_id:16,name:'W', time_start: '11:45',time_end:'13:00', instructor:'AIMAN HANNA',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:129,course_id:17,name:'CC', time_start: '15:30',time_end:'18:00', instructor:'NIKOLAOS TSANTALIS',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:130,course_id:17,name:'D', time_start: '14:45',time_end:'16:00', instructor:'NAGI BASHA',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:131,course_id:17,name:'S', time_start: '8:45',time_end:'10:00', instructor:'NANCY ACEMIAN',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:132,course_id:17,name:'U', time_start: '10:15',time_end:'11:30', instructor:'KERLY TITUS',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:133,course_id:17,name:'PP', time_start: '17:45',time_end:'20:15', instructor:'JEREMY CLARK',day_of_week:'---J---',term:'Winter')
# Section.create(id:134,course_id:18,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'DAVID PROBST',day_of_week:'M-WW-----',term:'Fall')
# Section.create(id:135,course_id:19,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'NEMATOLLAAH SHIRI-VARNAAMKHAASTI',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:136,course_id:19,name:'E', time_start: '10:15',time_end:'11:30', instructor:'LATA NARAYANAN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:137,course_id:19,name:'G', time_start: '8:45',time_end:'10:00', instructor:'SEYED ALI JANNATPOUR',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:138,course_id:19,name:'N', time_start: '11:45',time_end:'13:00', instructor:'GOSTA GRAHNE',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:139,course_id:19,name:'F', time_start: '10:15',time_end:'11:30', instructor:'JEREMY MACDONALD',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:140,course_id:21,name:'D', time_start: '13:15',time_end:'14:30', instructor:'JOEY PAQUET',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:141,course_id:21,name:'N', time_start: '16:15',time_end:'17:30', instructor:'DANIEL SINNIG',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:142,course_id:21,name:'S', time_start: '14:45',time_end:'16:00', instructor:'SEYED ALI JANNATPOUR',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:143,course_id:22,name:'CC', time_start: '18:30',time_end:'21:00', instructor:'TODD EAVIS',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:144,course_id:22,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'DHRUBAJYOTI GOSWAMI',day_of_week:'-T-----',term:'Fall')
# Section.create(id:145,course_id:22,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'AIMAN HANNA',day_of_week:'--W----',term:'Winter')
# Section.create(id:146,course_id:22,name:'WW', time_start: '17:45',time_end:'20:15', instructor:'AIMAN HANNA',day_of_week:'-T-----',term:'Winter')
# Section.create(id:147,course_id:23,name:'CC', time_start: '14:45',time_end:'17:15', instructor:'JAMAL BENTAHAR',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:148,course_id:23,name:'U', time_start: '8:45',time_end:'10:00', instructor:'MOHAMED TALEB',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:149,course_id:23,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'DAVID PROBST',day_of_week:'--W----',term:'Fall')
# Section.create(id:150,course_id:23,name:'E', time_start: '14:45',time_end:'16:00', instructor:'DAVID PROBST',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:151,course_id:24,name:'AA', time_start: '18:30',time_end:'21:00', instructor:'SUTHARSAN SIVAGNANAM',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:152,course_id:24,name:'G', time_start: '13:15',time_end:'14:30', instructor:'AIMAN HANNA',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:153,course_id:24,name:'H', time_start: '13:15',time_end:'14:30', instructor:'MOHAMED TALEB',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:154,course_id:24,name:'X', time_start: '13:15',time_end:'14:30', instructor:'NANCY ACEMIAN',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:155,course_id:25,name:'CC', time_start: '14:45',time_end:'17:15', instructor:'TODD EAVIS',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:156,course_id:25,name:'F', time_start: '13:15',time_end:'16:00', instructor:'BIPIN C. DESAI',day_of_week:'---J---',term:'Fall')
# Section.create(id:157,course_id:25,name:'W', time_start: '13:15',time_end:'14:30', instructor:'NEMATOLLAAH SHIRI-VARNAAMKHAASTI',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:158,course_id:25,name:'BB', time_start: '18:30',time_end:'21:00', instructor:'DANIEL SINNIG',day_of_week:'--W----',term:'Summer')
# Section.create(id:159,course_id:25,name:'E', time_start: '11:45',time_end:'13:00', instructor:'JUERGEN RILLING',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:160,course_id:25,name:'PP', time_start: '17:45',time_end:'20:15', instructor:'GREGORY BUTLER',day_of_week:'---J---',term:'Winter')
# Section.create(id:161,course_id:25,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'ADAM KRZYZAK',day_of_week:'----F--',term:'Fall')
# Section.create(id:162,course_id:25,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'EUSEBIUS DOEDEL',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:163,course_id:25,name:'A', time_start: '11:45',time_end:'13:00', instructor:'ARMEN ATOYAN',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:164,course_id:26,name:'CC', time_start: '18:30',time_end:'21:00', instructor:'NICOLAS BERGERON',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:165,course_id:26,name:'UU', time_start: '17:45',time_end:'20:15', instructor:'ADAM KRZYZAK',day_of_week:'-T-----',term:'Fall')
# Section.create(id:166,course_id:26,name:'WW', time_start: '17:45',time_end:'20:15', instructor:'NICOLAS BERGERON',day_of_week:'---J---',term:'Winter')
# Section.create(id:167,course_id:27,name:'W', time_start: '13:15',time_end:'16:00', instructor:'THOMAS FEVENS',day_of_week:'-T-----',term:'Fall')
# Section.create(id:168,course_id:27,name:'X', time_start: '13:15',time_end:'16:00', instructor:'THOMAS FEVENS',day_of_week:'---J---',term:'Fall')
# Section.create(id:169,course_id:28,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'RAJAGOPALAN JAYAKUMAR',day_of_week:'-T-----',term:'Fall')
# Section.create(id:170,course_id:64,name:'FF', time_start: '17:45',time_end:'20:15', instructor:'DHRUBAJYOTI GOSWAMI',day_of_week:'---J---',term:'Fall')
# Section.create(id:171,course_id:65,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'JOEY PAQUET',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:172,course_id:29,name:'D', time_start: '10:15',time_end:'11:30', instructor:'AIMAN HANNA',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:173,course_id:29,name:'W', time_start: '13:15',time_end:'14:30', instructor:'LATA NARAYANAN',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:174,course_id:31,name:'N', time_start: '16:15',time_end:'17:30', instructor:'HOVHANNES HARUTYUNYAN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:175,course_id:32,name:'F', time_start: '11:45',time_end:'13:00', instructor:'LEILA KOSSEIM',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:176,course_id:32,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'LEILA KOSSEIM',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:177,course_id:33,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'CHING YEE SUEN',day_of_week:'---J---',term:'Fall')
# Section.create(id:178,course_id:34,name:'UU', time_start: '17:45',time_end:'20:15', instructor:'NORA HOUARI',day_of_week:'--W----',term:'Winter')
# Section.create(id:179,course_id:35,name:'N', time_start: '14:45',time_end:'16:00', instructor:'THOMAS FEVENS',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:180,course_id:36,name:'N', time_start: '13:15',time_end:'14:30', instructor:'TIBERIU POPA',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:181,course_id:37,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'TIEN BUI',day_of_week:'M-WW-----',term:'Fall')
# Section.create(id:182,course_id:38,name:'D', time_start: '13:15',time_end:'14:30', instructor:'SABINE BERGLER',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:191,course_id:41,name:'H', time_start: '14:45',time_end:'16:00', instructor:'DONALD DAVIS',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:192,course_id:41,name:'DD', time_start: '17:45',time_end:'20:15', instructor:'TADEUSZ OBUCHOWICZ',day_of_week:'-T-----',term:'Winter')
# Section.create(id:193,course_id:42,name:'CC', time_start: '10:45',time_end:'13:15', instructor:'DANIEL SINNIG',day_of_week:'M-WWW----',term:'Summer')
# Section.create(id:194,course_id:42,name:'Q', time_start: '8:45',time_end:'10:00', instructor:'NANCY ACEMIAN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:195,course_id:42,name:'S', time_start: '8:45',time_end:'10:00', instructor:'NAGI BASHA',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:196,course_id:42,name:'U', time_start: '14:45',time_end:'16:00', instructor:'CHUN WANG',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:197,course_id:42,name:'W', time_start: '0:00',time_end:'0:00', instructor:'TERRILL FANCOTT',day_of_week:'-------',term:'Winter')
# Section.create(id:198,course_id:43,name:'GG', time_start: '17:45',time_end:'20:15', instructor:'AMR YOUSSEF',day_of_week:'M-WW-----',term:'Fall')
# Section.create(id:199,course_id:44,name:'U', time_start: '16:15',time_end:'17:30', instructor:'CONSTANTINOS CONSTANTINIDES',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:200,course_id:45,name:'H', time_start: '10:15',time_end:'11:30', instructor:'TERRILL FANCOTT',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:201,course_id:45,name:'S', time_start: '8:45',time_end:'10:00', instructor:'STUART THIEL',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:202,course_id:46,name:'H', time_start: '11:45',time_end:'13:00', instructor:'DANIEL SINNIG',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:203,course_id:47,name:'H', time_start: '13:15',time_end:'14:30', instructor:'PETER RIGBY',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:204,course_id:48,name:'S', time_start: '13:15',time_end:'14:30', instructor:'CONSTANTINOS CONSTANTINIDES',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:205,course_id:49,name:'S', time_start: '14:45',time_end:'16:00', instructor:'DANIEL SINNIG',day_of_week:'M-WWW----',term:'Winter')
# Section.create(id:206,course_id:50,name:'S', time_start: '10:15',time_end:'11:30', instructor:'RAJAGOPALAN JAYAKUMAR',day_of_week:'--W-F--',term:'Winter')
# Section.create(id:207,course_id:51,name:'F', time_start: '10:15',time_end:'11:30', instructor:'OLGA ORMANDJIEVA',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:208,course_id:52,name:'S', time_start: '11:45',time_end:'13:00', instructor:'TIEN BUI',day_of_week:'-T-J---',term:'Winter')
# Section.create(id:209,course_id:53,name:'F', time_start: '11:45',time_end:'13:00', instructor:'STUART THIEL',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:210,course_id:54,name:'S', time_start: '16:15',time_end:'17:55', instructor:'NIKOLAOS TSANTALIS',day_of_week:'M-WW-----',term:'Winter')
# Section.create(id:211,course_id:55,name:'MM', time_start: '17:45',time_end:'20:15', instructor:'TERRILL FANCOTT',day_of_week:'--W----',term:'Fall')
# Section.create(id:212,course_id:56,name:'H', time_start: '13:15',time_end:'14:30', instructor:'RAJAGOPALAN JAYAKUMAR',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:213,course_id:59,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'SERGUEI MOKHOV',day_of_week:'--W----',term:'Winter')
# Section.create(id:214,course_id:60,name:'SS', time_start: '18:25',time_end:'19:25', instructor:'PETER RIGBY',day_of_week:'----F--',term:'Fall&Winter')
# Section.create(id:215,course_id:66,name:'S', time_start: '16:15',time_end:'17:30', instructor:'SAMAR ABDI',day_of_week:'M-WWW----',term:'Fall')
# Section.create(id:216,course_id:62,name:'XX', time_start: '17:45',time_end:'20:15', instructor:'YOUMIN ZHANG',day_of_week:'---J---',term:'Fall')
# Section.create(id:217,course_id:63,name:'X', time_start: '14:45',time_end:'17:45', instructor:'NARENDRA KUMAR GOLLU',day_of_week:'M-WW-----',term:'Fall')
# Section.create(id:218,course_id:67,name:'CC', time_start: '11:45',time_end:'14:15', instructor:'VENKATANARAYANA RAMACHANDRAN',day_of_week:'-T-J---',term:'Summer')
# Section.create(id:219,course_id:67,name:'T', time_start: '11:45',time_end:'13:00', instructor:'VENKATANARAYANA RAMACHANDRAN',day_of_week:'--W-F--',term:'Fall')
# Section.create(id:220,course_id:67,name:'V', time_start: '8:45',time_end:'10:00', instructor:'VENKATANARAYANA RAMACHANDRAN',day_of_week:'-T-J---',term:'Fall')
# Section.create(id:221,course_id:67,name:'JJ', time_start: '17:45',time_end:'20:15', instructor:'VENKATANARAYANA RAMACHANDRAN',day_of_week:'-T-----',term:'Winter')
# Section.create(id:222,course_id:65,name:'NN', time_start: '17:45',time_end:'20:15', instructor:'JOEY PAQUET',day_of_week:'M-WW-----',term:'Winter')
#
# #Creating Tutorials
#
# Tutorial.create(id:1, section_id:1		,name:'AB',	time_start:'9:20', time_end:'10:10', day:'---J---')
# Tutorial.create(id:2, section_id:1		,name:'AC',	time_start:'11:00', time_end:'11:50', day:'---J---')
# Tutorial.create(id:3, section_id:1		,name:'AD',	time_start:'13:00', time_end:'13:50', day:'---J---')
# Tutorial.create(id:4, section_id:1		,name:'AF',	time_start:'14:00', time_end:'14:50', day:'---J---')
# Tutorial.create(id:5, section_id:2		,name:'GA',	time_start:'8:45', time_end:'9:35', day:'--W----')
# Tutorial.create(id:6, section_id:2		,name:'GB',	time_start:'8:45', time_end:'9:35', day:'--W----')
# Tutorial.create(id:7, section_id:2		,name:'GC',	time_start:'16:15', time_end:'17:05', day:'---J---')
# Tutorial.create(id:8, section_id:2		,name:'GD',	time_start:'16:15', time_end:'17:05', day:'---J---')
# Tutorial.create(id:9, section_id:3		,name:'HA',	time_start:'17:45', time_end:'18:35', day:'---J---')
# Tutorial.create(id:10, section_id:3		,name:'HB',	time_start:'17:45', time_end:'18:35', day:'---J---')
# Tutorial.create(id:11, section_id:3		,name:'HC',	time_start:'16:15', time_end:'17:05', day:'-T-----')
# Tutorial.create(id:12, section_id:3		,name:'HD',	time_start:'8:45', time_end:'9:35', day:'M------')
# Tutorial.create(id:13, section_id:4		,name:'QA',	time_start:'8:45', time_end:'9:35', day:'--W----')
# Tutorial.create(id:14, section_id:4		,name:'QB',	time_start:'8:45', time_end:'9:35', day:'--W----')
# Tutorial.create(id:15, section_id:4		,name:'QE',	time_start:'16:15', time_end:'17:05', day:'---J---')
# Tutorial.create(id:16, section_id:4		,name:'QF',	time_start:'16:15', time_end:'17:05', day:'---J---')
# Tutorial.create(id:17, section_id:4		,name:'EA',	time_start:'8:45', time_end:'9:35', day:'----F--')
# Tutorial.create(id:18, section_id:4		,name:'EB',	time_start:'8:45', time_end:'9:35', day:'----F--')
# Tutorial.create(id:19, section_id:4		,name:'EC',	time_start:'16:15', time_end:'17:05', day:'-T-----')
# Tutorial.create(id:20, section_id:4		,name:'ED',	time_start:'16:15', time_end:'17:05', day:'-T-----')
# Tutorial.create(id:21, section_id:10	,name:'AE',	time_start:'8:30', time_end:'10:10', day:'-T-J---')
# Tutorial.create(id:22, section_id:10	,name:'AF',	time_start:'8:30', time_end:'10:10', day:'-T-J---')
# Tutorial.create(id:23, section_id:11	,name:'PA',	time_start:'13:15', time_end:'14:55', day:'----F--')
# Tutorial.create(id:24, section_id:11	,name:'PB',	time_start:'13:15', time_end:'14:55', day:'----F--')
# Tutorial.create(id:25, section_id:12	,name:'RA',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:26, section_id:12	,name:'RB',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:27, section_id:13	,name:'TA',	time_start:'13:15', time_end:'14:55', day:'M------')
# Tutorial.create(id:28, section_id:13	,name:'TB',	time_start:'13:15', time_end:'14:55', day:'M------')
# Tutorial.create(id:29, section_id:14	,name:'UA',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:30, section_id:14	,name:'UB',	time_start:'14:15', time_end:'15:55', day:'M------')
# Tutorial.create(id:31, section_id:15	,name:'VA',	time_start:'13:45', time_end:'15:25', day:'---J---')
# Tutorial.create(id:32, section_id:15	,name:'VB',	time_start:'13:45', time_end:'15:25', day:'---J---')
# Tutorial.create(id:33, section_id:16	,name:'XA',	time_start:'13:15', time_end:'14:55', day:'M------')
# Tutorial.create(id:34, section_id:16	,name:'XB',	time_start:'13:15', time_end:'14:55', day:'M------')
# Tutorial.create(id:35, section_id:17	,name:'XE',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:36, section_id:17	,name:'XF',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:37, section_id:18	,name:'FA',	time_start:'18:00', time_end:'19:40', day:'M------')
# Tutorial.create(id:38, section_id:18	,name:'FB',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:39, section_id:18	,name:'FC',	time_start:'18:00', time_end:'19:40', day:'M------')
# Tutorial.create(id:40, section_id:18	,name:'FD',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:41, section_id:18	,name:'FE',	time_start:'18:00', time_end:'19:40', day:'M------')
# Tutorial.create(id:42, section_id:19	,name:'GA',	time_start:'16:10', time_end:'17:50', day:'M------')
# Tutorial.create(id:43, section_id:19	,name:'GB',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:44, section_id:19	,name:'GC',	time_start:'16:10', time_end:'17:50', day:'M------')
# Tutorial.create(id:45, section_id:19	,name:'GD',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:46, section_id:19	,name:'GE',	time_start:'16:10', time_end:'17:50', day:'M------')
# Tutorial.create(id:47, section_id:19	,name:'GF',	time_start:'18:00', time_end:'19:00', day:'M------')
# Tutorial.create(id:48, section_id:20	,name:'JA',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:49, section_id:20	,name:'JB',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:50, section_id:20	,name:'JC',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:51, section_id:20	,name:'JD',	time_start:'15:45', time_end:'17:25', day:'----F--')
# Tutorial.create(id:52, section_id:21	,name:'CD',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:53, section_id:21	,name:'CE',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:54, section_id:21	,name:'CF',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:55, section_id:21	,name:'CG',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:56, section_id:21	,name:'CH',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:57, section_id:22	,name:'PA',	time_start:'10:45', time_end:'12:25', day:'M------')
# Tutorial.create(id:58, section_id:22	,name:'PB',	time_start:'10:45', time_end:'12:25', day:'M------')
# Tutorial.create(id:59, section_id:23	,name:'QA',	time_start:'10:45', time_end:'12:25', day:'M------')
# Tutorial.create(id:60, section_id:23	,name:'QB',	time_start:'10:45', time_end:'12:25', day:'M------')
# Tutorial.create(id:61, section_id:24	,name:'JA',	time_start:'17:45', time_end:'19:25', day:'M------')
# Tutorial.create(id:62, section_id:24	,name:'JB',	time_start:'19:40', time_end:'21:20', day:'M------')
# Tutorial.create(id:63, section_id:24	,name:'JC',	time_start:'13:15', time_end:'15:05', day:'M------')
# Tutorial.create(id:64, section_id:25	,name:'RA',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:65, section_id:25	,name:'RB',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:66, section_id:25	,name:'RC',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:67, section_id:26	,name:'SA',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:68, section_id:26	,name:'SB',	time_start:'13:15', time_end:'14:55', day:'--W----')
# Tutorial.create(id:69, section_id:26	,name:'SC',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:70, section_id:27	,name:'TA',	time_start:'9:45', time_end:'11:25', day:'---J---')
# Tutorial.create(id:71, section_id:27	,name:'TB',	time_start:'9:45', time_end:'11:25', day:'---J---')
# Tutorial.create(id:72, section_id:27	,name:'TC',	time_start:'9:45', time_end:'11:25', day:'---J---')
# Tutorial.create(id:73, section_id:28	,name:'UA',	time_start:'9:45', time_end:'11:25', day:'M------')
# Tutorial.create(id:74, section_id:28	,name:'UB',	time_start:'13:15', time_end:'14:55', day:'M------')
# Tutorial.create(id:75, section_id:28	,name:'UC',	time_start:'9:45', time_end:'11:25', day:'M------')
# Tutorial.create(id:76, section_id:29	,name:'VA',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:77, section_id:29	,name:'VB',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:78, section_id:29	,name:'VC',	time_start:'8:20', time_end:'10:00', day:'M------')
# Tutorial.create(id:79, section_id:30	,name:'XA',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:80, section_id:30	,name:'XB',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:81, section_id:30	,name:'XC',	time_start:'14:15', time_end:'15:55', day:'----F--')
# Tutorial.create(id:82, section_id:31	,name:'TA',	time_start:'13:15', time_end:'14:55', day:'----F--')
# Tutorial.create(id:83, section_id:31	,name:'TB',	time_start:'13:15', time_end:'14:55', day:'----F--')
# Tutorial.create(id:84, section_id:32	,name:'VA',	time_start:'8:25', time_end:'10:05', day:'M------')
# Tutorial.create(id:85, section_id:32	,name:'VB',	time_start:'8:25', time_end:'10:05', day:'M------')
# Tutorial.create(id:86, section_id:33	,name:'XA',	time_start:'17:45', time_end:'19:25', day:'---J---')
# Tutorial.create(id:87, section_id:33	,name:'XB',	time_start:'17:45', time_end:'19:25', day:'--W----')
# Tutorial.create(id:88, section_id:34	,name:'YA',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:89, section_id:34	,name:'YB',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:90, section_id:35	,name:'JA',	time_start:'13:45', time_end:'15:25', day:'----F--')
# Tutorial.create(id:91, section_id:35	,name:'JB',	time_start:'13:45', time_end:'15:25', day:'----F--')
# Tutorial.create(id:92, section_id:36	,name:'LA',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:93, section_id:36	,name:'LB',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:94, section_id:37	,name:'AE',	time_start:'16:40', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:95, section_id:37	,name:'AF',	time_start:'13:00', time_end:'14:40', day:'-T-J---')
# Tutorial.create(id:96, section_id:37	,name:'AG',	time_start:'16:40', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:97, section_id:38	,name:'TA',	time_start:'11:45', time_end:'13:25', day:'--W----')
# Tutorial.create(id:98, section_id:38	,name:'TB',	time_start:'10:05', time_end:'11:45', day:'--W----')
# Tutorial.create(id:99, section_id:39	,name:'VA',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:100, section_id:39	,name:'VB',	time_start:'11:45', time_end:'13:25', day:'M------')
# Tutorial.create(id:101, section_id:40	,name:'XA',	time_start:'11:45', time_end:'13:25', day:'M------')
# Tutorial.create(id:102, section_id:40	,name:'XB',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:103, section_id:41	,name:'TE',	time_start:'20:30', time_end:'22:10', day:'---J---')
# Tutorial.create(id:104, section_id:41	,name:'TF',	time_start:'10:05', time_end:'11:45', day:'--W----')
# Tutorial.create(id:105, section_id:42	,name:'AE',	time_start:'16:30', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:106, section_id:42	,name:'AF',	time_start:'16:30', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:107, section_id:43	,name:'AG',	time_start:'16:30', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:108, section_id:44	,name:'MA',	time_start:'13:15', time_end:'15:05', day:'----F--')
# Tutorial.create(id:109, section_id:44	,name:'MB',	time_start:'13:15', time_end:'15:05', day:'M------')
# Tutorial.create(id:110, section_id:45	,name:'TA',	time_start:'14:45', time_end:'16:35', day:'M------')
# Tutorial.create(id:111, section_id:45	,name:'TB',	time_start:'16:15', time_end:'18:05', day:'----F--')
# Tutorial.create(id:112, section_id:46	,name:'VA',	time_start:'14:45', time_end:'16:35', day:'-T-----')
# Tutorial.create(id:113, section_id:46	,name:'VB',	time_start:'15:15', time_end:'17:05', day:'----F--')
# Tutorial.create(id:114, section_id:47	,name:'XA',	time_start:'16:15', time_end:'18:05', day:'----F--')
# Tutorial.create(id:115, section_id:47	,name:'XB',	time_start:'14:45', time_end:'16:30', day:'----F--')
# Tutorial.create(id:116, section_id:48	,name:'LA',	time_start:'17:45', time_end:'19:35', day:'M------')
# Tutorial.create(id:117, section_id:48	,name:'LB',	time_start:'17:45', time_end:'19:35', day:'M------')
# Tutorial.create(id:118, section_id:54	,name:'VA',	time_start:'12:00', time_end:'12:50', day:'-T-----')
# Tutorial.create(id:119, section_id:54	,name:'VB',	time_start:'12:00', time_end:'12:50', day:'---J---')
# Tutorial.create(id:120, section_id:50	,name:'CE',	time_start:'13:40', time_end:'15:20', day:'-T-J---')
# Tutorial.create(id:121, section_id:50	,name:'CF',	time_start:'13:40', time_end:'15:20', day:'-T-J---')
# Tutorial.create(id:122, section_id:50	,name:'CG',	time_start:'13:40', time_end:'15:20', day:'-T-J---')
# Tutorial.create(id:123, section_id:51	,name:'MA',	time_start:'16:15', time_end:'17:55', day:'----F--')
# Tutorial.create(id:124, section_id:51	,name:'MB',	time_start:'16:15', time_end:'17:55', day:'----F--')
# Tutorial.create(id:125, section_id:51	,name:'MC',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:126, section_id:53	,name:'TA',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:127, section_id:53	,name:'TB',	time_start:'16:15', time_end:'17:55', day:'----F--')
# Tutorial.create(id:128, section_id:53	,name:'TA',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:129, section_id:53	,name:'TB',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:130, section_id:54	,name:'VA',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:131, section_id:54	,name:'VB',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:132, section_id:55	,name:'XE',	time_start:'15:30', time_end:'17:10', day:'----F--')
# Tutorial.create(id:133, section_id:55	,name:'XF',	time_start:'15:30', time_end:'17:10', day:'----F--')
# Tutorial.create(id:134, section_id:56	,name:'FA',	time_start:'14:15', time_end:'16:05', day:'---J---')
# Tutorial.create(id:135, section_id:56	,name:'FB',	time_start:'14:15', time_end:'16:05', day:'-T-----')
# Tutorial.create(id:136, section_id:57	,name:'UA',	time_start:'11:45', time_end:'13:35', day:'--W----')
# Tutorial.create(id:137, section_id:57	,name:'UB',	time_start:'11:45', time_end:'13:35', day:'----F--')
# Tutorial.create(id:138, section_id:71	,name:'AE',	time_start:'16:15', time_end:'18:05', day:'---J---')
# Tutorial.create(id:139, section_id:71	,name:'AF',	time_start:'16:15', time_end:'18:05', day:'-T-----')
# Tutorial.create(id:140, section_id:71	,name:'AG',	time_start:'16:15', time_end:'18:05', day:'---J---')
# Tutorial.create(id:141, section_id:71	,name:'AH',	time_start:'16:15', time_end:'18:05', day:'-T-----')
# Tutorial.create(id:142, section_id:67	,name:'AI',	time_start:'18:30', time_end:'20:20', day:'M------')
# Tutorial.create(id:143, section_id:67	,name:'AJ',	time_start:'18:30', time_end:'20:20', day:'--W----')
# Tutorial.create(id:144, section_id:67	,name:'AK',	time_start:'16:15', time_end:'18:05', day:'M------')
# Tutorial.create(id:145, section_id:67	,name:'AL',	time_start:'16:15', time_end:'18:05', day:'--W----')
# Tutorial.create(id:146, section_id:60	,name:'GA',	time_start:'17:45', time_end:'18:35', day:'-T-----')
# Tutorial.create(id:147, section_id:60	,name:'GB',	time_start:'18:45', time_end:'19:35', day:'-T-----')
# Tutorial.create(id:148, section_id:60	,name:'GC',	time_start:'17:45', time_end:'18:35', day:'-T-----')
# Tutorial.create(id:149, section_id:60	,name:'GD',	time_start:'18:45', time_end:'19:35', day:'---J---')
# Tutorial.create(id:150, section_id:61	,name:'HA',	time_start:'17:45', time_end:'18:35', day:'---J---')
# Tutorial.create(id:151, section_id:61	,name:'HB',	time_start:'19:45', time_end:'20:35', day:'---J---')
# Tutorial.create(id:152, section_id:61	,name:'HC',	time_start:'19:45', time_end:'20:35', day:'-T-----')
# Tutorial.create(id:153, section_id:61	,name:'HD',	time_start:'19:45', time_end:'20:35', day:'-T-----')
# Tutorial.create(id:154, section_id:62	,name:'FA',	time_start:'17:45', time_end:'18:35', day:'M------')
# Tutorial.create(id:155, section_id:62	,name:'FB',	time_start:'18:45', time_end:'19:35', day:'M------')
# Tutorial.create(id:156, section_id:62	,name:'FC',	time_start:'17:45', time_end:'18:35', day:'M------')
# Tutorial.create(id:157, section_id:62	,name:'FD',	time_start:'18:45', time_end:'19:35', day:'--W----')
# Tutorial.create(id:158, section_id:63	,name:'IA',	time_start:'17:45', time_end:'18:35', day:'--W----')
# Tutorial.create(id:159, section_id:63	,name:'IB',	time_start:'18:45', time_end:'19:35', day:'--W----')
# Tutorial.create(id:160, section_id:63	,name:'IC',	time_start:'17:45', time_end:'18:35', day:'--W----')
# Tutorial.create(id:161, section_id:63	,name:'ID',	time_start:'18:45', time_end:'19:35', day:'M------')
# Tutorial.create(id:162, section_id:64	,name:'RA',	time_start:'17:45', time_end:'18:35', day:'-T-----')
# Tutorial.create(id:163, section_id:64	,name:'RB',	time_start:'17:45', time_end:'18:35', day:'-T-----')
# Tutorial.create(id:164, section_id:64	,name:'RC',	time_start:'18:45', time_end:'19:35', day:'---J---')
# Tutorial.create(id:165, section_id:64	,name:'RD',	time_start:'18:45', time_end:'19:35', day:'---J---')
# Tutorial.create(id:166, section_id:65	,name:'SA',	time_start:'17:45', time_end:'18:35', day:'---J---')
# Tutorial.create(id:167, section_id:65	,name:'SB',	time_start:'17:45', time_end:'18:35', day:'---J---')
# Tutorial.create(id:168, section_id:65	,name:'SC',	time_start:'18:45', time_end:'19:35', day:'-T-----')
# Tutorial.create(id:169, section_id:65	,name:'SD',	time_start:'18:45', time_end:'19:35', day:'-T-----')
# Tutorial.create(id:170, section_id:71	,name:'AE',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:171, section_id:71	,name:'AF',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:172, section_id:67	,name:'AG',	time_start:'8:45', time_end:'10:25', day:'-T-J---')
# Tutorial.create(id:173, section_id:67	,name:'AH',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:174, section_id:68	,name:'TA',	time_start:'8:30', time_end:'10:10', day:'-T-----')
# Tutorial.create(id:175, section_id:68	,name:'TB',	time_start:'8:30', time_end:'10:10', day:'---J---')
# Tutorial.create(id:176, section_id:74	,name:'XA',	time_start:'8:30', time_end:'10:10', day:'-T-----')
# Tutorial.create(id:177, section_id:74	,name:'XB',	time_start:'8:30', time_end:'10:10', day:'---J---')
# Tutorial.create(id:178, section_id:70	,name:'YA',	time_start:'8:45', time_end:'10:25', day:'--W----')
# Tutorial.create(id:179, section_id:70	,name:'YB',	time_start:'8:45', time_end:'10:25', day:'--W----')
# Tutorial.create(id:180, section_id:71	,name:'AE',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:181, section_id:71	,name:'AF',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:182, section_id:72	,name:'LA',	time_start:'10:15', time_end:'11:05', day:'M------')
# Tutorial.create(id:183, section_id:72	,name:'LB',	time_start:'10:15', time_end:'11:05', day:'--W----')
# Tutorial.create(id:184, section_id:73	,name:'VA',	time_start:'13:15', time_end:'14:05', day:'--W----')
# Tutorial.create(id:185, section_id:73	,name:'VB',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:186, section_id:74	,name:'XA',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:187, section_id:74	,name:'XB',	time_start:'16:15', time_end:'17:05', day:'----F--')
# Tutorial.create(id:188, section_id:74	,name:'EA',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:189, section_id:74	,name:'EB',	time_start:'16:15', time_end:'17:05', day:'----F--')
# Tutorial.create(id:190, section_id:75	,name:'CE',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:191, section_id:75	,name:'CF',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:192, section_id:75	,name:'CG',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:193, section_id:76	,name:'CE',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:194, section_id:76	,name:'CF',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:195, section_id:76	,name:'CG',	time_start:'21:15', time_end:'22:05', day:'M-W----')
# Tutorial.create(id:196, section_id:77	,name:'RA',	time_start:'11:45', time_end:'12:35', day:'M------')
# Tutorial.create(id:197, section_id:77	,name:'RB',	time_start:'10:15', time_end:'11:05', day:'M------')
# Tutorial.create(id:198, section_id:78	,name:'SA',	time_start:'13:15', time_end:'14:05', day:'-T-----')
# Tutorial.create(id:199, section_id:78	,name:'SB',	time_start:'13:15', time_end:'14:05', day:'---J---')
# Tutorial.create(id:200, section_id:79	,name:'FA',	time_start:'17:45', time_end:'18:35', day:'-T-----')
# Tutorial.create(id:201, section_id:79	,name:'FB',	time_start:'17:45', time_end:'18:35', day:'--W----')
# Tutorial.create(id:202, section_id:80	,name:'TA',	time_start:'10:15', time_end:'11:05', day:'----F--')
# Tutorial.create(id:203, section_id:80	,name:'TB',	time_start:'10:15', time_end:'11:05', day:'----F--')
# Tutorial.create(id:204, section_id:81	,name:'WA',	time_start:'8:45', time_end:'9:35', day:'--W----')
# Tutorial.create(id:205, section_id:81	,name:'WB',	time_start:'8:45', time_end:'9:35', day:'----F--')
# Tutorial.create(id:206, section_id:82	,name:'UA',	time_start:'14:45', time_end:'15:35', day:'----F--')
# Tutorial.create(id:207, section_id:82	,name:'UB',	time_start:'14:45', time_end:'15:35', day:'M------')
# Tutorial.create(id:208, section_id:83	,name:'AE',	time_start:'21:10', time_end:'22:00', day:'-T-J---')
# Tutorial.create(id:209, section_id:83	,name:'AF',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:210, section_id:84	,name:'CE',	time_start:'21:10', time_end:'22:00', day:'-T-J---')
# Tutorial.create(id:211, section_id:84	,name:'CF',	time_start:'21:10', time_end:'22:00', day:'-T-J---')
# Tutorial.create(id:212, section_id:85	,name:'FA',	time_start:'14:15', time_end:'15:05', day:'----F--')
# Tutorial.create(id:213, section_id:85	,name:'FB',	time_start:'16:15', time_end:'17:05', day:'----F--')
# Tutorial.create(id:214, section_id:86	,name:'MA',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:215, section_id:86	,name:'MB',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:216, section_id:86	,name:'MC',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:217, section_id:87	,name:'SA',	time_start:'14:15', time_end:'15:05', day:'----F--')
# Tutorial.create(id:218, section_id:87	,name:'SB',	time_start:'16:15', time_end:'17:05', day:'----F--')
# Tutorial.create(id:219, section_id:88	,name:'VA',	time_start:'11:45', time_end:'12:35', day:'----F--')
# Tutorial.create(id:220, section_id:88	,name:'VB',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:221, section_id:89	,name:'XA',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:222, section_id:89	,name:'XB',	time_start:'15:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:223, section_id:90	,name:'UA',	time_start:'20:30', time_end:'21:20', day:'---J---')
# Tutorial.create(id:224, section_id:90	,name:'UB',	time_start:'20:35', time_end:'21:25', day:'---J---')
# Tutorial.create(id:225, section_id:111	,name:'DA',	time_start:'20:30', time_end:'21:20', day:'-T-----')
# Tutorial.create(id:226, section_id:108	,name:'QA',	time_start:'20:30', time_end:'21:20', day:'-T-----')
# Tutorial.create(id:227, section_id:109	,name:'AE',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:228, section_id:109	,name:'AF',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:229, section_id:110	,name:'UA',	time_start:'14:45', time_end:'16:25', day:'M------')
# Tutorial.create(id:230, section_id:110	,name:'UB',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:231, section_id:111	,name:'DA',	time_start:'20:30', time_end:'22:10', day:'--W----')
# Tutorial.create(id:232, section_id:111	,name:'DB',	time_start:'20:30', time_end:'22:10', day:'--W----')
# Tutorial.create(id:233, section_id:111	,name:'DC',	time_start:'20:30', time_end:'22:10', day:'M------')
# Tutorial.create(id:234, section_id:112	,name:'PA',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:235, section_id:112	,name:'PB',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:236, section_id:112	,name:'PC',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:237, section_id:113	,name:'AE',	time_start:'13:45', time_end:'15:25', day:'-T-J---')
# Tutorial.create(id:238, section_id:120	,name:'QA',	time_start:'16:15', time_end:'17:55', day:'-T-----')
# Tutorial.create(id:239, section_id:120	,name:'QB',	time_start:'14:45', time_end:'16:25', day:'---J---')
# Tutorial.create(id:240, section_id:115	,name:'RA',	time_start:'16:15', time_end:'17:55', day:'-T-----')
# Tutorial.create(id:241, section_id:115	,name:'RB',	time_start:'16:15', time_end:'17:55', day:'-T-----')
# Tutorial.create(id:242, section_id:122	,name:'DA',	time_start:'20:30', time_end:'22:10', day:'--W----')
# Tutorial.create(id:243, section_id:122	,name:'DB',	time_start:'20:30', time_end:'22:10', day:'--W----')
# Tutorial.create(id:244, section_id:117	,name:'SA',	time_start:'14:45', time_end:'16:25', day:'-T-----')
# Tutorial.create(id:245, section_id:117	,name:'SB',	time_start:'14:45', time_end:'16:25', day:'-T-----')
# Tutorial.create(id:246, section_id:118	,name:'NA',	time_start:'20:30', time_end:'22:10', day:'---J---')
# Tutorial.create(id:247, section_id:118	,name:'NB',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:248, section_id:119	,name:'CE',	time_start:'16:40', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:249, section_id:119	,name:'CF',	time_start:'11:15', time_end:'13:00', day:'--W-F--')
# Tutorial.create(id:250, section_id:120	,name:'QA',	time_start:'10:15', time_end:'11:55', day:'-T-----')
# Tutorial.create(id:251, section_id:120	,name:'QB',	time_start:'10:15', time_end:'11:55', day:'-T-----')
# Tutorial.create(id:252, section_id:121	,name:'NA',	time_start:'14:45', time_end:'16:35', day:'M------')
# Tutorial.create(id:253, section_id:121	,name:'NB',	time_start:'14:45', time_end:'16:35', day:'M------')
# Tutorial.create(id:254, section_id:122	,name:'DA',	time_start:'11:45', time_end:'13:35', day:'---J---')
# Tutorial.create(id:255, section_id:122	,name:'DB',	time_start:'11:45', time_end:'13:35', day:'---J---')
# Tutorial.create(id:256, section_id:123	,name:'AE',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:257, section_id:123	,name:'AF',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:258, section_id:123	,name:'AG',	time_start:'16:40', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:259, section_id:124	,name:'QA',	time_start:'10:15', time_end:'11:55', day:'M------')
# Tutorial.create(id:260, section_id:124	,name:'QB',	time_start:'10:15', time_end:'11:55', day:'--W----')
# Tutorial.create(id:261, section_id:124	,name:'QC',	time_start:'8:45', time_end:'10:25', day:'----F--')
# Tutorial.create(id:262, section_id:124	,name:'QD',	time_start:'10:15', time_end:'11:55', day:'M------')
# Tutorial.create(id:263, section_id:125	,name:'RA',	time_start:'8:45', time_end:'10:25', day:'----F--')
# Tutorial.create(id:264, section_id:125	,name:'RB',	time_start:'10:15', time_end:'11:55', day:'M------')
# Tutorial.create(id:265, section_id:125	,name:'RC',	time_start:'10:15', time_end:'11:55', day:'--W----')
# Tutorial.create(id:266, section_id:126	,name:'EA',	time_start:'11:45', time_end:'13:35', day:'-T-----')
# Tutorial.create(id:267, section_id:126	,name:'EB',	time_start:'11:45', time_end:'13:35', day:'---J---')
# Tutorial.create(id:268, section_id:126	,name:'EC',	time_start:'17:45', time_end:'19:35', day:'M------')
# Tutorial.create(id:269, section_id:127	,name:'UA',	time_start:'11:45', time_end:'13:25', day:'----F--')
# Tutorial.create(id:270, section_id:127	,name:'UB',	time_start:'11:45', time_end:'13:25', day:'--W----')
# Tutorial.create(id:271, section_id:128	,name:'WA',	time_start:'10:15', time_end:'11:50', day:'M------')
# Tutorial.create(id:272, section_id:128	,name:'WB',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:273, section_id:129	,name:'CE',	time_start:'18:20', time_end:'20:00', day:'-T-J---')
# Tutorial.create(id:274, section_id:129	,name:'CF',	time_start:'18:20', time_end:'20:00', day:'M-W----')
# Tutorial.create(id:275, section_id:130	,name:'DA',	time_start:'12:45', time_end:'14:25', day:'M------')
# Tutorial.create(id:276, section_id:130	,name:'DB',	time_start:'16:15', time_end:'17:55', day:'--W----')
# Tutorial.create(id:277, section_id:131	,name:'SA',	time_start:'10:15', time_end:'11:55', day:'--W----')
# Tutorial.create(id:278, section_id:131	,name:'SB',	time_start:'11:45', time_end:'13:25', day:'M------')
# Tutorial.create(id:279, section_id:132	,name:'UA',	time_start:'10:15', time_end:'11:55', day:'M------')
# Tutorial.create(id:280, section_id:132	,name:'UB',	time_start:'11:45', time_end:'13:25', day:'--W----')
# Tutorial.create(id:281, section_id:133	,name:'PA',	time_start:'20:30', time_end:'22:10', day:'---J---')
# Tutorial.create(id:282, section_id:133	,name:'PB',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:283, section_id:133	,name:'PC',	time_start:'20:30', time_end:'22:10', day:'---J---')
# Tutorial.create(id:284, section_id:133	,name:'PD',	time_start:'17:45', time_end:'19:25', day:'----F--')
# Tutorial.create(id:285, section_id:134	,name:'DA',	time_start:'20:30', time_end:'21:20', day:'M------')
# Tutorial.create(id:286, section_id:134	,name:'DB',	time_start:'21:30', time_end:'22:20', day:'M------')
# Tutorial.create(id:287, section_id:135	,name:'AE',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:288, section_id:135	,name:'AF',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:289, section_id:136	,name:'EA',	time_start:'11:45', time_end:'12:35', day:'---J---')
# Tutorial.create(id:290, section_id:136	,name:'EB',	time_start:'11:45', time_end:'12:35', day:'---J---')
# Tutorial.create(id:291, section_id:137	,name:'GA',	time_start:'10:15', time_end:'11:05', day:'-T-----')
# Tutorial.create(id:292, section_id:138	,name:'NA',	time_start:'13:15', time_end:'14:05', day:'-T-----')
# Tutorial.create(id:293, section_id:139	,name:'FA',	time_start:'11:45', time_end:'13:35', day:'M------')
# Tutorial.create(id:294, section_id:143	,name:'CA',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:295, section_id:143	,name:'CB',	time_start:'17:30', time_end:'18:20', day:'-T-J---')
# Tutorial.create(id:296, section_id:144	,name:'DA',	time_start:'20:30', time_end:'21:20', day:'-T-----')
# Tutorial.create(id:297, section_id:144	,name:'DB',	time_start:'20:30', time_end:'21:20', day:'-T-----')
# Tutorial.create(id:298, section_id:145	,name:'NA',	time_start:'20:20', time_end:'21:10', day:'--W----')
# Tutorial.create(id:299, section_id:145	,name:'NB',	time_start:'13:15', time_end:'14:05', day:'M------')
# Tutorial.create(id:300, section_id:146	,name:'WA',	time_start:'20:00', time_end:'21:10', day:'-T-----')
# Tutorial.create(id:301, section_id:146	,name:'WB',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:302, section_id:147	,name:'CE',	time_start:'13:15', time_end:'14:05', day:'M-W----')
# Tutorial.create(id:303, section_id:147	,name:'CF',	time_start:'13:15', time_end:'14:05', day:'M-W----')
# Tutorial.create(id:304, section_id:147	,name:'CG',	time_start:'13:15', time_end:'14:05', day:'M-W----')
# Tutorial.create(id:305, section_id:148	,name:'UA',	time_start:'10:15', time_end:'11:05', day:'M------')
# Tutorial.create(id:306, section_id:148	,name:'UB',	time_start:'10:15', time_end:'11:05', day:'M------')
# Tutorial.create(id:307, section_id:149	,name:'DA',	time_start:'14:45', time_end:'15:35', day:'-T-----')
# Tutorial.create(id:308, section_id:149	,name:'DB',	time_start:'14:45', time_end:'15:35', day:'---J---')
# Tutorial.create(id:309, section_id:150	,name:'EI',	time_start:'16:15', time_end:'17:05', day:'M------')
# Tutorial.create(id:310, section_id:150	,name:'EJ',	time_start:'16:15', time_end:'17:05', day:'--W----')
# Tutorial.create(id:311, section_id:151	,name:'AE',	time_start:'17:30', time_end:'18:20', day:'M-W----')
# Tutorial.create(id:312, section_id:151	,name:'AF',	time_start:'16:30', time_end:'17:20', day:'M-W----')
# Tutorial.create(id:313, section_id:152	,name:'GA',	time_start:'14:45', time_end:'15:35', day:'----F--')
# Tutorial.create(id:314, section_id:152	,name:'GB',	time_start:'11:45', time_end:'12:35', day:'M------')
# Tutorial.create(id:315, section_id:152	,name:'GC',	time_start:'11:45', time_end:'12:35', day:'M------')
# Tutorial.create(id:316, section_id:153	,name:'HA',	time_start:'14:45', time_end:'15:35', day:'-T-----')
# Tutorial.create(id:317, section_id:153	,name:'HB',	time_start:'14:45', time_end:'15:35', day:'---J---')
# Tutorial.create(id:318, section_id:154	,name:'XA',	time_start:'16:15', time_end:'17:05', day:'M------')
# Tutorial.create(id:319, section_id:154	,name:'XB',	time_start:'16:15', time_end:'17:05', day:'--W----')
# Tutorial.create(id:320, section_id:155	,name:'CE',	time_start:'13:15', time_end:'14:05', day:'M-W----')
# Tutorial.create(id:321, section_id:156	,name:'FA',	time_start:'12:15', time_end:'13:05', day:'---J---')
# Tutorial.create(id:322, section_id:157	,name:'WA',	time_start:'16:15', time_end:'17:05', day:'--W----')
# Tutorial.create(id:323, section_id:157	,name:'WB',	time_start:'16:15', time_end:'17:05', day:'--W----')
# Tutorial.create(id:324, section_id:158	,name:'BE',	time_start:'17:30', time_end:'18:20', day:'--W----')
# Tutorial.create(id:325, section_id:158	,name:'BF',	time_start:'17:30', time_end:'18:20', day:'--W----')
# Tutorial.create(id:326, section_id:159	,name:'EA',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:327, section_id:159	,name:'EF',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:328, section_id:160	,name:'PA',	time_start:'20:30', time_end:'21:20', day:'---J---')
# Tutorial.create(id:329, section_id:160	,name:'PB',	time_start:'20:30', time_end:'21:20', day:'---J---')
# Tutorial.create(id:330, section_id:161	,name:'DA',	time_start:'20:30', time_end:'21:20', day:'----F--')
# Tutorial.create(id:331, section_id:162	,name:'NA',	time_start:'17:45', time_end:'18:35', day:'--W----')
# Tutorial.create(id:332, section_id:170	,name:'FA',	time_start:'20:30', time_end:'21:20', day:'---J---')
# Tutorial.create(id:333, section_id:170	,name:'FB',	time_start:'20:30', time_end:'21:20', day:'---J---')
# Tutorial.create(id:334, section_id:174	,name:'NA',	time_start:'13:15', time_end:'14:05', day:'--W----')
# Tutorial.create(id:335, section_id:191	,name:'HA',	time_start:'16:15', time_end:'17:55', day:'--W----')
# Tutorial.create(id:336, section_id:191	,name:'HB',	time_start:'16:15', time_end:'17:55', day:'--W----')
# Tutorial.create(id:337, section_id:191	,name:'HC',	time_start:'16:15', time_end:'17:55', day:'--W----')
# Tutorial.create(id:338, section_id:192	,name:'DA',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:339, section_id:192	,name:'DB',	time_start:'20:30', time_end:'22:10', day:'-T-----')
# Tutorial.create(id:340, section_id:193	,name:'CE',	time_start:'8:45', time_end:'10:25', day:'M-W----')
# Tutorial.create(id:341, section_id:193	,name:'CF',	time_start:'8:45', time_end:'10:25', day:'M-W----')
# Tutorial.create(id:342, section_id:194	,name:'QA',	time_start:'10:15', time_end:'11:55', day:'-T-----')
# Tutorial.create(id:343, section_id:194	,name:'QB',	time_start:'18:15', time_end:'19:55', day:'---J---')
# Tutorial.create(id:344, section_id:195	,name:'SA',	time_start:'10:15', time_end:'11:55', day:'-T-----')
# Tutorial.create(id:345, section_id:195	,name:'SB',	time_start:'10:15', time_end:'11:55', day:'---J---')
# Tutorial.create(id:346, section_id:196	,name:'UA',	time_start:'16:15', time_end:'17:55', day:'-T-----')
# Tutorial.create(id:347, section_id:196	,name:'UB',	time_start:'16:15', time_end:'17:55', day:'---J---')
# Tutorial.create(id:348, section_id:196	,name:'UC',	time_start:'15:15', time_end:'16:55', day:'----F--')
# Tutorial.create(id:349, section_id:196	,name:'UD',	time_start:'16:15', time_end:'17:55', day:'-T-----')
# Tutorial.create(id:350, section_id:198	,name:'GA',	time_start:'20:30', time_end:'21:20', day:'M------')
# Tutorial.create(id:351, section_id:198	,name:'GB',	time_start:'20:30', time_end:'21:20', day:'M------')
# Tutorial.create(id:352, section_id:199	,name:'UA',	time_start:'14:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:353, section_id:199	,name:'UB',	time_start:'14:15', time_end:'16:05', day:'----F--')
# Tutorial.create(id:354, section_id:200	,name:'HA',	time_start:'11:45', time_end:'12:35', day:'----F--')
# Tutorial.create(id:355, section_id:200	,name:'HB',	time_start:'12:45', time_end:'13:35', day:'----F--')
# Tutorial.create(id:356, section_id:201	,name:'SA',	time_start:'12:15', time_end:'13:05', day:'----F--')
# Tutorial.create(id:357, section_id:201	,name:'SB',	time_start:'13:15', time_end:'14:05', day:'----F--')
# Tutorial.create(id:358, section_id:201	,name:'SC',	time_start:'14:15', time_end:'15:05', day:'----F--')
# Tutorial.create(id:359, section_id:202	,name:'HA',	time_start:'15:45', time_end:'16:35', day:'----F--')
# Tutorial.create(id:360, section_id:202	,name:'HB',	time_start:'15:45', time_end:'16:35', day:'----F--')
# Tutorial.create(id:361, section_id:203	,name:'HA',	time_start:'14:45', time_end:'15:35', day:'----F--')
# Tutorial.create(id:362, section_id:203	,name:'HB',	time_start:'14:45', time_end:'15:35', day:'----F--')
# Tutorial.create(id:363, section_id:204	,name:'SA',	time_start:'14:45', time_end:'15:35', day:'---J---')
# Tutorial.create(id:364, section_id:205	,name:'SA',	time_start:'16:15', time_end:'17:05', day:'--W----')
# Tutorial.create(id:365, section_id:205	,name:'SB',	time_start:'17:45', time_end:'18:35', day:'--W----')
# Tutorial.create(id:366, section_id:206	,name:'SA',	time_start:'11:45', time_end:'12:35', day:'----F--')
# Tutorial.create(id:367, section_id:207	,name:'FA',	time_start:'9:15', time_end:'10:05', day:'----F--')
# Tutorial.create(id:368, section_id:208	,name:'SA',	time_start:'10:45', time_end:'11:35', day:'-T-----')
# Tutorial.create(id:369, section_id:208	,name:'SB',	time_start:'10:45', time_end:'11:35', day:'---J---')
# Tutorial.create(id:370, section_id:208	,name:'SC',	time_start:'10:45', time_end:'11:35', day:'M------')
# Tutorial.create(id:371, section_id:209	,name:'FA',	time_start:'11:45', time_end:'12:35', day:'----F--')
# Tutorial.create(id:372, section_id:209	,name:'FB',	time_start:'11:45', time_end:'12:35', day:'----F--')
# Tutorial.create(id:373, section_id:210	,name:'SA',	time_start:'18:15', time_end:'19:05', day:'M------')
# Tutorial.create(id:374, section_id:210	,name:'SB',	time_start:'18:15', time_end:'19:05', day:'M------')
# Tutorial.create(id:375, section_id:211	,name:'ME',	time_start:'20:20', time_end:'21:05', day:'--W----')
# Tutorial.create(id:376, section_id:212	,name:'HA',	time_start:'14:45', time_end:'15:35', day:'-T-----')
# Tutorial.create(id:377, section_id:213	,name:'NA',	time_start:'16:25', time_end:'17:15', day:'--W----')
# Tutorial.create(id:378, section_id:218	,name:'CE',	time_start:'15:00', time_end:'16:40', day:'-T-J---')
# Tutorial.create(id:379, section_id:218	,name:'CF',	time_start:'15:00', time_end:'16:40', day:'-T-J---')
# Tutorial.create(id:380, section_id:219	,name:'TA',	time_start:'13:15', time_end:'14:55', day:'----F--')
# Tutorial.create(id:381, section_id:220	,name:'VA',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:382, section_id:220	,name:'VB',	time_start:'14:45', time_end:'16:25', day:'--W----')
# Tutorial.create(id:383, section_id:221	,name:'JA',	time_start:'9:45', time_end:'11:25', day:'--W----')
# Tutorial.create(id:384, section_id:221	,name:'JB',	time_start:'10:15', time_end:'11:55', day:'--W----')
# Tutorial.create(id:385, section_id:215	,name:'SA',	time_start:'14:45', time_end:'15:35', day:'--W----')
#
# #Creating Laboratories
# Laboratory.create(id:1,tutorial_id:105,name:'AI',time_start:'10:30',time_end:'13:15',day:'-T-----')
# Laboratory.create(id:2,tutorial_id:105,name:'AJ',time_start:'10:30',time_end:'13:15',day:'---J---')
# Laboratory.create(id:3,tutorial_id:105,name:'AK',time_start:'13:30',time_end:'16:15',day:'--W----')
# Laboratory.create(id:4,tutorial_id:106,name:'AL',time_start:'13:40',time_end:'16:25',day:'M------')
# Laboratory.create(id:5,tutorial_id:106,name:'AM',time_start:'13:30',time_end:'16:15',day:'-T-----')
# Laboratory.create(id:6,tutorial_id:106,name:'AN',time_start:'10:30',time_end:'13:15',day:'----F--')
# Laboratory.create(id:7,tutorial_id:107,name:'AN',time_start:'13:30',time_end:'16:15',day:'---J---')
# Laboratory.create(id:8,tutorial_id:107,name:'AO',time_start:'10:30',time_end:'13:15',day:'--W----')
# Laboratory.create(id:9,tutorial_id:107,name:'AP',time_start:'10:30',time_end:'13:15',day:'M------')
# Laboratory.create(id:10,tutorial_id:107,name:'AQ',time_start:'16:30',time_end:'19:15',day:'-T-----')
# Laboratory.create(id:11,tutorial_id:108,name:'MI',time_start:'8:45',time_end:'11:30',day:'--W----')
# Laboratory.create(id:12,tutorial_id:108,name:'MJ',time_start:'8:45',time_end:'11:30',day:'--W----')
# Laboratory.create(id:13,tutorial_id:108,name:'MK',time_start:'8:45',time_end:'11:30',day:'----F--')
# Laboratory.create(id:14,tutorial_id:109,name:'ML',time_start:'8:45',time_end:'11:30',day:'----F--')
# Laboratory.create(id:15,tutorial_id:109,name:'MM',time_start:'11:45',time_end:'14:30',day:'----F--')
# Laboratory.create(id:16,tutorial_id:109,name:'MN',time_start:'11:45',time_end:'14:30',day:'----F--')
# Laboratory.create(id:17,tutorial_id:110,name:'TH',time_start:'14:45',time_end:'17:30',day:'-T-----')
# Laboratory.create(id:18,tutorial_id:110,name:'TI',time_start:'8:45',time_end:'11:30',day:'-T-----')
# Laboratory.create(id:20,tutorial_id:111,name:'TK',time_start:'14:45',time_end:'17:30',day:'M------')
# Laboratory.create(id:19,tutorial_id:110,name:'TJ',time_start:'8:45',time_end:'11:30',day:'-T-----')
# Laboratory.create(id:21,tutorial_id:111,name:'TL',time_start:'8:45',time_end:'11:30',day:'---J---')
# Laboratory.create(id:22,tutorial_id:111,name:'TM',time_start:'14:45',time_end:'17:30',day:'-T-----')
# Laboratory.create(id:23,tutorial_id:112,name:'VI',time_start:'11:45',time_end:'14:30',day:'-T-----')
# Laboratory.create(id:24,tutorial_id:112,name:'VJ',time_start:'11:45',time_end:'14:30',day:'-T-----')
# Laboratory.create(id:25,tutorial_id:112,name:'VK',time_start:'14:45',time_end:'17:30',day:'--W----')
# Laboratory.create(id:26,tutorial_id:113,name:'VL',time_start:'14:45',time_end:'17:30',day:'--W----')
# Laboratory.create(id:27,tutorial_id:113,name:'VM',time_start:'11:45',time_end:'14:30',day:'---J---')
# Laboratory.create(id:28,tutorial_id:113,name:'VN',time_start:'11:45',time_end:'14:30',day:'---J---')
# Laboratory.create(id:29,tutorial_id:114,name:'XI',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:30,tutorial_id:114,name:'XJ',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:31,tutorial_id:114,name:'XM',time_start:'14:45',time_end:'17:30',day:'---J---')
# Laboratory.create(id:32,tutorial_id:115,name:'XK',time_start:'14:45',time_end:'17:30',day:'M------')
# Laboratory.create(id:33,tutorial_id:115,name:'XL',time_start:'8:45',time_end:'11:30',day:'---J---')
# Laboratory.create(id:34,tutorial_id:115,name:'XN',time_start:'14:45',time_end:'17:30',day:'---J---')
# Laboratory.create(id:35,tutorial_id:116,name:'LI',time_start:'17:45',time_end:'20:30',day:'-T-----')
# Laboratory.create(id:36,tutorial_id:116,name:'LJ',time_start:'17:45',time_end:'20:30',day:'-T-----')
# Laboratory.create(id:37,tutorial_id:116,name:'LK',time_start:'14:45',time_end:'17:30',day:'----F--')
# Laboratory.create(id:38,tutorial_id:117,name:'LM',time_start:'14:45',time_end:'17:30',day:'----F--')
# Laboratory.create(id:39,tutorial_id:117,name:'LN',time_start:'17:45',time_end:'20:30',day:'---J---')
# Laboratory.create(id:40,tutorial_id:117,name:'LO',time_start:'17:45',time_end:'20:30',day:'---J---')
# Laboratory.create(id:41,tutorial_id:294,name:'CI',time_start:'21:10',time_end:'23:00',day:'-T-J---')
# Laboratory.create(id:42,tutorial_id:295,name:'CJ',time_start:'21:10',time_end:'23:00',day:'-T-J---')
# Laboratory.create(id:43,tutorial_id:296,name:'DI',time_start:'17:45',time_end:'19:35',day:'---J---')
# Laboratory.create(id:44,tutorial_id:297,name:'DJ',time_start:'19:45',time_end:'21:35',day:'---J---')
# Laboratory.create(id:45,tutorial_id:298,name:'NI',time_start:'21:15',time_end:'23:05',day:'--W----')
# Laboratory.create(id:46,tutorial_id:299,name:'NJ',time_start:'14:15',time_end:'16:05',day:'M------')
# Laboratory.create(id:47,tutorial_id:300,name:'WI',time_start:'21:15',time_end:'23:05',day:'-T-----')
# Laboratory.create(id:48,tutorial_id:301,name:'WJ',time_start:'14:15',time_end:'16:05',day:'----F--')
# Laboratory.create(id:49,tutorial_id:320,name:'CI',time_start:'10:15',time_end:'12:05',day:'M-W----')
# Laboratory.create(id:50,tutorial_id:320,name:'CJ',time_start:'8:15',time_end:'10:05',day:'M-W----')
# Laboratory.create(id:51,tutorial_id:321,name:'FI',time_start:'16:15',time_end:'18:05',day:'---J---')
# Laboratory.create(id:52,tutorial_id:321,name:'FJ',time_start:'13:15',time_end:'15:05',day:'----F--')
# Laboratory.create(id:53,tutorial_id:322,name:'WI',time_start:'17:15',time_end:'19:05',day:'--W----')
# Laboratory.create(id:54,tutorial_id:323,name:'WJ',time_start:'17:15',time_end:'19:05',day:'M------')
# Laboratory.create(id:55,tutorial_id:324,name:'BI',time_start:'21:10',time_end:'23:00',day:'--W----')
# Laboratory.create(id:56,tutorial_id:325,name:'BJ',time_start:'21:10',time_end:'23:00',day:'--W----')
# Laboratory.create(id:57,tutorial_id:326,name:'EI',time_start:'14:20',time_end:'15:50',day:'----F--')
# Laboratory.create(id:58,tutorial_id:327,name:'EJ',time_start:'16:00',time_end:'17:30',day:'----F--')
# Laboratory.create(id:59,tutorial_id:328,name:'PI',time_start:'21:30',time_end:'23:00',day:'---J---')
# Laboratory.create(id:60,tutorial_id:329,name:'PJ',time_start:'21:30',time_end:'23:00',day:'---J---')
# Laboratory.create(id:61,tutorial_id:332,name:'FI',time_start:'0:00',time_end:'0:00',day:'-------')
# Laboratory.create(id:62,tutorial_id:333,name:'FJ',time_start:'0:00',time_end:'0:00',day:'-------')
# Laboratory.create(id:63,tutorial_id:335,name:'HI',time_start:'10:00',time_end:'12:00',day:'-T-----')
# Laboratory.create(id:64,tutorial_id:335,name:'HJ',time_start:'10:00',time_end:'12:00',day:'--W----')
# Laboratory.create(id:65,tutorial_id:336,name:'HK',time_start:'18:00',time_end:'20:00',day:'--W----')
# Laboratory.create(id:66,tutorial_id:336,name:'HL',time_start:'16:15',time_end:'18:15',day:'M------')
# Laboratory.create(id:67,tutorial_id:337,name:'HM',time_start:'10:00',time_end:'12:00',day:'---J---')
# Laboratory.create(id:68,tutorial_id:337,name:'HN',time_start:'12:15',time_end:'14:15',day:'--W----')
# Laboratory.create(id:69,tutorial_id:338,name:'DI',time_start:'10:00',time_end:'12:00',day:'-T-----')
# Laboratory.create(id:70,tutorial_id:338,name:'DJ',time_start:'10:00',time_end:'12:00',day:'M------')
# Laboratory.create(id:71,tutorial_id:339,name:'DK',time_start:'10:00',time_end:'12:00',day:'--W----')
# Laboratory.create(id:72,tutorial_id:339,name:'DL',time_start:'10:00',time_end:'12:00',day:'M------')
# Laboratory.create(id:73,tutorial_id:339,name:'DM',time_start:'18:00',time_end:'20:15',day:'--W----')
# Laboratory.create(id:74,tutorial_id:373,name:'SI',time_start:'15:45',time_end:'18:25',day:'---J---')
# Laboratory.create(id:75,tutorial_id:374,name:'SK',time_start:'15:45',time_end:'18:25',day:'-T-----')
# Laboratory.create(id:76,tutorial_id:375,name:'MI',time_start:'21:10',time_end:'23:00',day:'--W----')
# Laboratory.create(id:77,tutorial_id:375,name:'MJ',time_start:'14:45',time_end:'16:35',day:'---J---')
# Laboratory.create(id:78,tutorial_id:376,name:'HI',time_start:'15:45',time_end:'17:30',day:'-T-----')
# Laboratory.create(id:79,tutorial_id:377,name:'NI',time_start:'20:30',time_end:'22:20',day:'--W----')
# Laboratory.create(id:80,tutorial_id:378,name:'CI',time_start:'8:45',time_end:'11:30',day:'--W----')
# Laboratory.create(id:81,tutorial_id:378,name:'CL',time_start:'12:30',time_end:'15:15',day:'--W----')
# Laboratory.create(id:82,tutorial_id:379,name:'CJ',time_start:'8:45',time_end:'11:30',day:'-T-----')
# Laboratory.create(id:83,tutorial_id:379,name:'CK',time_start:'8:45',time_end:'11:30',day:'---J---')
# Laboratory.create(id:84,tutorial_id:380,name:'TI',time_start:'11:45',time_end:'14:30',day:'-T-----')
# Laboratory.create(id:85,tutorial_id:380,name:'TJ',time_start:'11:45',time_end:'14:30',day:'---J---')
# Laboratory.create(id:86,tutorial_id:380,name:'TK',time_start:'8:45',time_end:'11:30',day:'----F--')
# Laboratory.create(id:87,tutorial_id:381,name:'VI',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:88,tutorial_id:381,name:'VJ',time_start:'14:45',time_end:'17:30',day:'M------')
# Laboratory.create(id:89,tutorial_id:382,name:'VK',time_start:'14:45',time_end:'17:30',day:'M------')
# Laboratory.create(id:90,tutorial_id:382,name:'VL',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:91,tutorial_id:383,name:'JI',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:92,tutorial_id:383,name:'JL',time_start:'17:45',time_end:'20:30',day:'--W----')
# Laboratory.create(id:93,tutorial_id:383,name:'JM',time_start:'17:45',time_end:'20:30',day:'M------')
# Laboratory.create(id:94,tutorial_id:384,name:'JJ',time_start:'8:45',time_end:'11:30',day:'M------')
# Laboratory.create(id:95,tutorial_id:384,name:'JK',time_start:'17:45',time_end:'20:30',day:'---J---')
# Laboratory.create(id:96,tutorial_id:384,name:'JN',time_start:'17:45',time_end:'20:30',day:'---J---')

#Creating Course_prereq relation


#Creating Core SOEN Course Relation with Sequence
s = Sequence.new
s.sequence_name = 'Software Engineering Core'
a = Course.find_by dept: 'SOEN', number: 228
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 287
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 321
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 331
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 341
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 342
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 343
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 344
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 345
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 357
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 384
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 385
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 390
s.courses.append(a)
puts a
a = Course.find_by dept: 'SOEN', number: 490
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 232
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 248
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 249
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 335
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 346
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 348
s.courses.append(a)
puts a
a = Course.find_by dept: 'COMP', number: 352
s.courses.append(a)
puts a
a = Course.find_by dept:'ELEC', number:275
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENCS', number:282
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:201
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:202
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:213
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:233
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:301
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:371
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:391
s.courses.append(a)
puts a.name + a.number.to_s
a = Course.find_by dept:'ENGR', number:392
s.courses.append(a)
puts a.name + a.number.to_s
s.save
#
# # #Creating Computer games specialization sequence-course associations
s = Sequence.new
s.sequence_name = 'Computer Games'
s.sequence_id = 6

a = Course.find_by dept: 'COMP', number: 345
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 371
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 376
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 472
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 476
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 477
s.courses.append(a)
s.save

# #Creating Web services specialization sequence-course associations
s = Sequence.new
s.sequence_name = 'Web Services and Applications'
s.sequence_id = 7

a = Course.find_by dept: 'COMP', number: 353
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 445
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 479
s.courses.append(a)
a = Course.find_by dept: 'SOEN', number: 387
s.courses.append(a)
a = Course.find_by dept: 'SOEN', number: 487
s.courses.append(a)
s.save
# #Creating Real‑Time Embedded and Avionics Software sequence-course associations
s = Sequence.new
s.sequence_name = 'RealTime Embedded and Avionics Software'
s.sequence_id = 8
a = Course.find_by dept: 'AERO', number: 480
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'AERO', number: 482
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COEN', number: 320
s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 345
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 444
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 422
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 423
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
# #Creating General sequence-course association
s = Sequence.new
s.sequence_name = 'General'
s.sequence_id = 9
a = Course.find_by dept: 'AERO', number: 480
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'AERO', number: 482
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COEN', number: 320
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 345
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 353
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 371
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 376
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 426
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 428
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 442
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 444
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 445
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 451
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 465
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 472
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 473
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 474
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 476
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 477
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 478
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 479
s.courses.append(a)
puts a.dept + a.number.to_s
## COURSES  NOT YET ENTERED ################################
# # a = Course.find_by dept: 'ENGR', number: 411
# # s.courses.append(a)
# # puts a.dept + a.number.to_s
# # a = Course.find_by dept: 'SOEN', number: 298
# # s.courses.append(a)
# # puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 387
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 422
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 423
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 448
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 487
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 491
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
#
# # Required Web Services
a = Course.find_by dept:'COMP', number: 353
s = Sequence.new
s.sequence_name = 'Required Web Services and Applications'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'SOEN', number: 387
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
# #OneOf Web Services
a = Course.find_by dept:'COMP', number: 479
s = Sequence.new
s.sequence_name = 'OneOf Web Services and Applications'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'SOEN', number: 487
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
#
# # Required Computer games
a = Course.find_by dept:'COMP', number: 371
s = Sequence.new
s.sequence_name = 'Required Computer Games'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'COMP', number: 376
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
# # OneOf Computer Games
a = Course.find_by dept:'COMP', number: 476
s = Sequence.new
s.sequence_name = 'OneOf Computer Games'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'COMP', number: 477
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
# # Required RealTime
a = Course.find_by dept:'SOEN', number: 422
s = Sequence.new
s.sequence_name = 'Required RealTime Embedded and Avionics Software'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'SOEN', number: 423
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
# # One of Realtime
a = Course.find_by dept:'AERO', number: 480
s = Sequence.new
s.sequence_name = 'OneOf RealTime Embedded and Avionics Software'
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept:'AERO', number: 482
s.courses.append(a)
puts a.dept + a.number.to_s
s.save
