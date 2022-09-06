# Flutter temperature conversion

Segundo Eric Evans em seu livro <b>Domain-Driven Design: Atacando as complexidades no coração do software</b>, OBJETOS DE VALOR são instanciados para representar elementos do design com os quais só nos preocupamos pelo <i>que</i> eles são, e não <i>quem</i> ou <i>quais</i> são.

Ou seja, com objetos de valor podemos garantir a representatividade e a consistência dos dados. Com a definição desse conceito, esse projeto tem como objetivo realizar a conversão de uma dada temperatura de acordo com a escala escolhida, sendo elas Celsius, Fahrenheit e Kelvin, através do uso de objetos de valor.

## Tecnologias/bibliotecas

Algumas das tecnologias/bibliotecas utilizadas na construção do aplicativo foram:

 - Flutter toolkit 3.3.0 (stable)
 - Dart 2.18.0
 - equatable: 2.0.5
 - fpdart: 0.2.0
 - provider: 6.0.3
 - dart_code_metrics 4.17.1
 - flutter_lints: 2.0.0
 - value_listenable_test: 0.0.1
 - flutter_launcher_icons: 0.10.0
 - flutter_native_splash: 2.2.8

Além dessas, há também outras bibliotecas. O pubspec.yaml possui a lista completa das bibliotecas utilizadas.

## Introdução

Dada uma unidade de medida, por exemplo, metro, e seu respectivo valor, ao realizar a troca dessa unidade para centímetro, automaticamente o seu valor deve ser convertido de acordo com a unidade correspondente.

Um caminho simples para isso seria criar uma função, recebendo o valor original como argumento, aplicar o cálculo de conversão e retornar o novo valor.

Mas, o que fazer com esse valor? Talvez, para um script simples, rodando em linha de comando, onde a entrada é o valor original e a saída é o valor convertido, imprimí-lo no terminal já seria suficiente.

No entanto, em um sistema completo, com inúmeras responsabilidades, de preferência isoladas, torna-se necessário uma estratégia bem mais elaborada.

Dentre algumas estratégias, uma seria criar uma entidade para deixar o valor armazenado e resgatá-lo em qualquer parte do sistema, seja na edição, em uma busca ou até mesmo utilizá-lo como parte de um cálculo para obter um outro dado de interesse.

No entanto, como fazer para armazenar esse valor convertido em uma entidade? Simplesmente obter esse dado em uma função externa atribuí-lo em seu respectivo atributo? Talvez não seja uma boa ideia. Primeiro porque poderia ferir o princípio de imutabilidade da entidade. Segundo porque essa conversão poderia simplesmente ser a regra de negócio do sistema, como é o caso desse projeto.

Sendo a regra de negócio, o recomendado seria que a conversão ocorresse diretamente na entidade.

## O projeto

Como descrito no início desse texto, objetos de valor representa elementos pelo <i>que</i> eles são. No caso desse projeto, o elemento principal é o valor obtido de acordo com a sua escala escolhida, seja Celsius, Fahrenheit ou Kelvin.

No caso desse projeto, o objeto de valor aplicado teria como finalidade garantir a consistência e a representatividade do dado, estando de acordo com a escala escolhida.

Resumidamente, a função de conversão e a atribuição do dado convertido estariam embutidos no respectivo objeto de valor.

É exatamente essa a proposta desse projeto.

### Conversão através de objeto de valor

Mas como fazer isso? Veja o código abaixo.

```dart
  import 'dart:math';

  import 'package:equatable/equatable.dart';

  import '../core/temperature_scale.dart';
  import 'temperature_value_objects.dart';

  class Temperature extends Equatable {
    final TemperatureValueObjects value;
    final TemperatureScale scale;

    const Temperature({
      required this.value,
      required this.scale,
    });

    @override
    List<Object> get props => [value, scale];

    factory Temperature.initial() => Temperature(
          value: TemperatureValueObjects(
            from: TemperatureScale.celsius,
            to: TemperatureScale.celsius,
            value: Random().nextInt(57).toDouble(),
          ),
          scale: TemperatureScale.celsius,
        );
  }
```

Temos uma entidade chamada <b>Temperature</b>. Essa entidade possui um atributo chamado <b>value</b>, que ao invés de ser do tipo double, ele é do tipo <b>TemperatureValueObjects</b>, o nosso objeto de valor. Veja o código de <b>TemperatureValueObjects</b>.

```dart
  import 'package:fpdart/fpdart.dart';

  import '../core/temperature_scale.dart';
  import '../core/value_objects.dart';
  import '../core/value_transformers.dart';

  class TemperatureValueObjects extends ValueObjects {
    @override
    final Either<void, double> value;

    factory TemperatureValueObjects({
      required TemperatureScale from,
      required TemperatureScale to,
      required double value,
    }) =>
        TemperatureValueObjects._(
          convertTemperature(
            from: from,
            to: to,
            value: value,
          ),
        );

    TemperatureValueObjects._(this.value);
  }
```

O objeto de valor <b>TemperatureValueObjects</b> possui o seu construtor privado, não podendo ser instanciado fora da própria classe. Em seu lugar, a instância externa será através de uma <b>factory</b>, responsável por receber a escala atual (<b>from</b>), a nova escala de interesse (<b>to</b>) e o valor a ser convertido.

Dentro dessa factory, é executada a função externa <b>convertTemperature</b> responsável por aplicar o cálculo de conversão, de acordo com a escala atual, a nova escala escolhida e o valor atual, retornando o novo valor convertido. 

Esse valor convertido é armazenado no próprio objeto de valor <b>TemperatureValueObjects</b>, através da instanciação do construtor privado, estando assim disponível no atributo value, da entidade Temperature.

Sempre que ocorre a troca de uma escala, uma nova instância de <b>Temperature</b> é gerada, já com o novo valor convertido, devido ao seu objeto de valor <b>TemperatureValueObjects</b>.

## Exemplos