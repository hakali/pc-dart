// See file LICENSE for more information.

library impl.ec_domain_parameters.secp256r1;

import 'package:pointycastle_pc335/ecc/api.dart';
import 'package:pointycastle_pc335/ecc/ecc_base.dart';
import 'package:pointycastle_pc335/src/ec_standard_curve_constructor.dart';
import 'package:pointycastle_pc335/src/registry/registry.dart';

// ignore: camel_case_types
class ECCurve_secp256r1 extends ECDomainParametersImpl {
  static final FactoryConfig factoryConfig = StaticFactoryConfig(
      ECDomainParameters, 'secp256r1', () => ECCurve_secp256r1());

  factory ECCurve_secp256r1() => constructFpStandardCurve(
      'secp256r1', ECCurve_secp256r1._make,
      q: BigInt.parse('ffffffff00000001000000000000000000000000ffffffffffffffffffffffff',
          radix: 16),
      a: BigInt.parse(
          'ffffffff00000001000000000000000000000000fffffffffffffffffffffffc',
          radix: 16),
      b: BigInt.parse(
          '5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b',
          radix: 16),
      g: BigInt.parse(
          '046b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c2964fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5',
          radix: 16),
      n: BigInt.parse(
          'ffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551',
          radix: 16),
      h: BigInt.parse('1', radix: 16),
      seed: BigInt.parse('c49d360886e704936a6678e1139d26b7819f7e90',
          radix: 16)) as ECCurve_secp256r1;

  static ECCurve_secp256r1 _make(String domainName, ECCurve curve, ECPoint G,
          BigInt n, BigInt _h, List<int> seed) =>
      ECCurve_secp256r1._super(domainName, curve, G, n, _h, seed);

  ECCurve_secp256r1._super(String domainName, ECCurve curve, ECPoint G,
      BigInt n, BigInt _h, List<int> seed)
      : super(domainName, curve, G, n, _h, seed);
}
