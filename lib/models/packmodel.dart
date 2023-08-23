import 'dart:convert';

PackModel packModelFromJson(String str) => PackModel.fromJson(json.decode(str));

String packModelToJson(PackModel data) => json.encode(data.toJson());

class PackModel {
  Info info;
  List<Item> item;

  PackModel({
    required this.info,
    required this.item,
  });

  @override
  String toString() {
    return 'PackModel{info: $info, item: $item}';
  }

  factory PackModel.fromJson(Map<String, dynamic> json) => PackModel(
        info: Info.fromJson(json["info"]),
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Info {
  String postmanId;
  String name;
  String schema;
  String exporterId;

  @override
  String toString() {
    return 'Info{postmanId: $postmanId, name: $name, schema: $schema, exporterId: $exporterId, collectionLink: $collectionLink}';
  }

  String collectionLink;

  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
    required this.exporterId,
    required this.collectionLink,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        exporterId: json["_exporter_id"],
        collectionLink: json["_collection_link"],
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "_exporter_id": exporterId,
        "_collection_link": collectionLink,
      };
}

class Item {
  String name;
  Request request;
  List<dynamic> response;

  Item({
    required this.name,
    required this.request,
    required this.response,
  });

  @override
  String toString() {
    return 'Item{name: $name, request: $request, response: $response}';
  }

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
      };
}

class Request {
  Method method;
  List<Header> header;
  Body? body;
  Url url;

  @override
  String toString() {
    return 'Request{method: $method, header: $header, body: $body, url: $url}';
  }

  Request({
    required this.method,
    required this.header,
    this.body,
    required this.url,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: methodValues.map[json["method"]]!,
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        url: Url.fromJson(json["url"]),
      );

  Map<String, dynamic> toJson() => {
        "method": methodValues.reverse[method],
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "body": body?.toJson(),
        "url": url.toJson(),
      };
}

class Body {
  Mode mode;
  List<Header> urlencoded;

  @override
  String toString() {
    return 'Body{mode: $mode, urlencoded: $urlencoded}';
  }

  Body({
    required this.mode,
    required this.urlencoded,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: modeValues.map[json["mode"]]!,
        urlencoded: List<Header>.from(
            json["urlencoded"].map((x) => Header.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "urlencoded": List<dynamic>.from(urlencoded.map((x) => x.toJson())),
      };
}

enum Mode { URLENCODED }

final modeValues = EnumValues({"urlencoded": Mode.URLENCODED});

class Header {
  String key;
  String value;
  Type type;

  @override
  String toString() {
    return 'Header{key: $key, value: $value, type: $type, disabled: $disabled}';
  }

  bool? disabled;

  Header({
    required this.key,
    required this.value,
    required this.type,
    this.disabled,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
        type: typeValues.map[json["type"]]!,
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": typeValues.reverse[type],
        "disabled": disabled,
      };
}

enum Type { DEFAULT, TEXT }

final typeValues = EnumValues({"default": Type.DEFAULT, "text": Type.TEXT});

enum Method { GET, POST }

final methodValues = EnumValues({"GET": Method.GET, "POST": Method.POST});

class Url {
  String raw;
  Protocol protocol;
  List<String> host;
  List<String> path;
  List<Query>? query;

  @override
  String toString() {
    return 'Url{raw: $raw, protocol: $protocol, host: $host, path: $path, query: $query, port: $port}';
  }

  String? port;

  Url({
    required this.raw,
    required this.protocol,
    required this.host,
    required this.path,
    this.query,
    this.port,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        protocol: protocolValues.map[json["protocol"]]!,
        host: List<String>.from(json["host"].map((x) => x)),
        path: List<String>.from(json["path"].map((x) => x)),
        query: json["query"] == null
            ? []
            : List<Query>.from(json["query"]!.map((x) => Query.fromJson(x))),
        port: json["port"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "protocol": protocolValues.reverse[protocol],
        "host": List<dynamic>.from(host.map((x) => x)),
        "path": List<dynamic>.from(path.map((x) => x)),
        "query": query == null
            ? []
            : List<dynamic>.from(query!.map((x) => x.toJson())),
        "port": port,
      };
}

enum Protocol { HTTPS }

final protocolValues = EnumValues({"https": Protocol.HTTPS});

class Query {
  String key;
  String? value;

  @override
  String toString() {
    return 'Query{key: $key, value: $value}';
  }

  Query({
    required this.key,
    required this.value,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
