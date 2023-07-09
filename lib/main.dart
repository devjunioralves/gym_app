import 'package:flutter/material.dart';

void main() => runApp(const GymApp());

class GymApp extends StatelessWidget {
  const GymApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gym App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Acesse sua conta',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Acessar'),
                onPressed: () {
                  // Implemente a lógica de autenticação aqui
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutListPage()),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ainda não tem conta? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    child: const Text('Criar conta'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirmar senha'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Criar e acessar'),
              onPressed: () {
                // Implemente a lógica para criar uma nova conta e acessar a página principal
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutListPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutListPage extends StatelessWidget {
  final List<Workout> workouts = [
    Workout('Treino 1', [
      Exercise('Exercício 1', 'https://url-do-video-1.com'),
      Exercise('Exercício 2', 'https://url-do-video-2.com'),
    ]),
    Workout('Treino 2', [
      Exercise('Exercício 3', 'https://url-do-video-3.com'),
      Exercise('Exercício 4', 'https://url-do-video-4.com'),
    ]),
  ];

  WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Treinos')),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return ListTile(
            title: Text(workout.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseListPage(workout),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExerciseListPage extends StatelessWidget {
  final Workout workout;

  const ExerciseListPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(workout.name)),
      body: ListView.builder(
        itemCount: workout.exercises.length,
        itemBuilder: (context, index) {
          final exercise = workout.exercises[index];
          return ListTile(
            title: Text(exercise.name),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(exercise.name),
                    content: const Text('Exibição do vídeo aqui'),
                    actions: [
                      TextButton(
                        child: const Text('Fechar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Workout {
  final String name;
  final List<Exercise> exercises;

  Workout(this.name, this.exercises);
}

class Exercise {
  final String name;
  final String videoUrl;

  Exercise(this.name, this.videoUrl);
}
