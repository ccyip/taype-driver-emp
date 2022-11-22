type 'a t = {
  under : 'a array;
  pos : int;
  len : int;
}

let length : 'a t -> int = fun v -> v.len

let get : 'a t -> int -> 'a = fun v n -> v.under.(v.pos + n)

let make : int -> 'a -> 'a t = fun n x -> {
    under = Array.make n x;
    pos = 0;
    len = n;
  }

let init : int -> (int -> 'a) -> 'a t = fun n f -> {
    under = Array.init n f;
    pos = 0;
    len = n;
  }

let append : 'a t -> 'a t -> 'a t = fun v1 v2 ->
  if v1.len = 0 then v2
  else if v2.len = 0 then v1
  else
    let len = v1.len + v2.len in
    let under = Array.make len v1.under.(v1.pos) in
    Array.blit v1.under v1.pos under 0 v1.len;
    Array.blit v2.under v2.pos under v1.len v2.len;
    { under; pos = 0; len }

let sub : 'a t -> int -> int -> 'a t = fun v pos len -> {
    under = v.under;
    pos = v.pos + pos;
    len;
  }
