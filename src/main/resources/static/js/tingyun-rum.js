window._ty_rum && window._ty_rum.server || function (t) {
    function r() {
        var t = K(et);
        return t || (t = tt(), Q(et, t)), t
    }

    function e() {
        var t = n(nt);
        return t || (t = tt(), a(nt, t)), t
    }

    function n(t) {
        if ("string" != typeof t) return null;
        var r = B.cookie;
        if (!r) return null;
        var e = null, n = r.split(";");
        return F.each(n, function (r) {
            var n = r.split("=");
            if (F.trim(n[0]) === F.trim(t)) return e = n[1], !0
        }), e
    }

    function a(t, r, e) {
        var n = t + "=" + r;
        if (e) {
            var a = new Date;
            a.setTime(a.getTime() + 1e3 * e), n += ";expires=" + a.toGMTString()
        }
        B.cookie = n
    }

    function i(t) {
        switch (typeof t) {
            case"object":
                if (!t) return "null";
                if (t instanceof Array) {
                    for (var r = "[", e = 0; e < t.length; e++) r += (e > 0 ? "," : "") + i(t[e]);
                    return r + "]"
                }
                if (t instanceof Date) return t.getTime().toString();
                var r = "{", e = 0;
                for (var n in t) if ("function" != typeof t[n]) {
                    var a = i(t[n]);
                    r += (e > 0 ? "," : "") + i(n) + ":" + a, e++
                }
                return r + "}";
            case"string":
                return '"' + t.replace(/([\"\\])/g, "\\$1").replace(/\n/g, "\\n") + '"';
            case"number":
                return t.toString();
            case"boolean":
                return t ? "true" : "false";
            case"function":
                return i(t.toString());
            case"undefined":
            default:
                return '"undefined"'
        }
    }

    function o(t) {
        return H ? H(t) : t
    }

    function s() {
        return Date.now ? Date.now() : (new Date).valueOf()
    }

    function u(t, r, e) {
        function n() {
            var t = F.args.apply(this, arguments);
            return r(i, t, e)
        }

        var a, i = t[t.length - 1];
        if ("function" == typeof i) {
            switch (i.length) {
                case 0:
                    a = function () {
                        return n.apply(this, arguments)
                    };
                    break;
                case 1:
                    a = function (t) {
                        return n.apply(this, arguments)
                    };
                    break;
                case 2:
                    a = function (t, r) {
                        return n.apply(this, arguments)
                    };
                    break;
                case 3:
                    a = function (t, r, e) {
                        return n.apply(this, arguments)
                    };
                    break;
                case 4:
                    a = function (t, r, e, a) {
                        return n.apply(this, arguments)
                    };
                    break;
                case 5:
                    a = function (t, r, e, a, i) {
                        return n.apply(this, arguments)
                    };
                    break;
                default:
                    for (var o = [], s = 0, u = i.length; s < u; s++) o.push("_" + s);
                    a = eval("(function(){return function(" + o.join(",") + "){var args = [].slice.call(arguments, 0);return r(i, args, e);};})();")
            }
            t[t.length - 1] = a
        }
        return t
    }

    function c(t, r) {
        return t && r && (t.moduleName = r), t
    }

    function f(t, r, e) {
        return function () {
            try {
                O = r, e && l(r), t.apply(this, arguments), e && p()
            } catch (n) {
                throw e && p(), c(n, r)
            }
        }
    }

    function l(r) {
        F.each(["setTimeout", "setInterval"], function (e) {
            F.wrap(!0, t, e, function (t) {
                return function () {
                    var e, n = F.args.apply(this, arguments), a = n[0];
                    return "function" == typeof a && (e = f(a, r, !0)), e && (n[0] = e), t.apply ? t.apply(this, n) : Function.prototype.apply.apply(t, [t, n])
                }
            })
        })
    }

    function p() {
        F.each(["setTimeout", "setInterval"], function (r) {
            F.unwrap(t, r)
        })
    }

    function d(t) {
        M && F.wrap(!1, M.prototype, "addEventListener", function (r) {
            return function () {
                var e, n = F.args.apply(this, arguments), a = n[1];
                return "function" == typeof a && (e = f(a, t, !0)), e && (n[1] = e), r.apply(this, n)
            }
        }), l(t)
    }

    function h() {
        M && F.unwrap(M.prototype, "addEventListener"), p()
    }

    function m(t) {
        return function (t, r) {
        }
    }

    function y() {
        return st && st.indexOf("1") > -1
    }

    function v() {
        var t = 0;
        if (j.firstPaint) t = j.firstPaint; else if (ot) {
            var r = ot.timing;
            t = r.domLoading, ot.getEntriesByName && F.each(B.querySelectorAll("head>link, head>script"), function (e) {
                var n;
                if ("LINK" == e.tagName ? n = e.href : "SCRIPT" == e.tagName && (e.defer || (n = e.src)), n) {
                    var a = ot.getEntriesByName(n);
                    if (1 == a.length) {
                        var i = a[0].responseEnd + r.navigationStart;
                        i > t && (t = i)
                    }
                }
            }), t -= r.navigationStart, j.firstPaint = Math.round(t)
        }
        return t
    }

    function g() {
        if (j.fs) return j.fs;
        j.firstPaint || v();
        var r = j.firstPaint, e = t.innerHeight;
        if (ot && ot.getEntriesByName) {
            var n = [];
            F.each(B.querySelectorAll("img"), function (t) {
                "none" != t.style.display && "" != t.src && t.offsetTop <= e && n.push(t.src)
            }), F.each(n, function (t) {
                var e = ot.getEntriesByName(t);
                if (e.length) {
                    var n = e[0].responseEnd;
                    n > r && (r = n)
                }
            })
        }
        return j.fs = Math.round(r), r
    }

    function _() {
        var t = ot.timing && ot.timing.navigationStart || j.st, r = j.end_time - t;
        return j.dr = r, r
    }

    function S() {
        if (this.errors.length) {
            var t = function (t) {
                var r = [], e = {};
                F.each(t, function (t) {
                    var r = N(t[1], t[2], t[3], t[6]);
                    e[r] ? e[r][4] += 1 : e[r] = [t[1], t[2], t[3], "#" == t[4] ? B.URL : t[4], 1, t[5], t[6], t[7]]
                });
                for (var n in e) r.push(e[n]);
                return r
            }(this.errors), r = this;
            F.POST(F.mkurl(j.server.beacon, "err", {
                fu: U ? U : U++,
                os: parseInt((s() - (z || j.st)) / 1e3)
            }), F.stringify({datas: t}), {}, function (t, e) {
                t || (r.errors = [])
            })
        }
    }

    function T() {
        ut.initend()
    }

    function w() {
        "complete" === B.readyState && ut.initend()
    }

    function E(t) {
        function r() {
            ut.send()
        }

        return !!j.load_time || (ut.initend(), j.load_time = s(), void(9 === t ? r() : setTimeout(r, 0)))
    }

    function b() {
        ct || E(9), F.bind(S, ut)(), ct = 1
    }

    function x() {
        ut.touch || (ut.touch = s())
    }

    function k(t) {
        if (t[6]) {
            var r = t[4], e = t[5];
            if (e && "string" == typeof e && r) {
                e = e.split(/\n/);
                var n = $.exec(e[0]);
                n || (n = $.exec(e[1])), n && n[1] != r && (t[4] = n[1] || r, t[2] = n[2] || t[2], t[3] = n[3] || t[3])
            }
        }
    }

    function N(t, r, e, n) {
        return String(t) + String(r) + String(e) + String(n)
    }

    function P(r) {
        var e = arguments, n = "unknown", a = [s()];
        if (0 != e.length) {
            if ("string" == typeof r) {
                var i = e.length < 4 ? e.length : 4;
                a[1] = e[0], i > 2 && (a[2] = e[2], a[3] = 0, a[4] = e[1]), i > 3 && e[3] && (a[3] = e[3])
            } else if (r instanceof Event || t.ErrorEvent && r instanceof ErrorEvent) {
                if (a[1] = r.message || (r.error && r.error.constructor.name) + (r.error && r.error.message) || "", a[2] = r.lineno ? r.lineno : 0, a[3] = r.colno ? r.colno : 0, a[4] = r.filename || r.error && r.error.fileName || r.target && r.target.baseURI || "", !a[4] && Y) return;
                a[4] == B.URL && (a[4] = "#"), r.error ? (a[5] = r.error.stack, a[6] = r.error.moduleName) : (a[5] = null, a[6] = null);
                var o = N(a[1], a[2], a[3], a[6]);
                if (a[7] = ft[o] ? 0 : 1, ft[o] = !0, a[1] === n && a[4] === n) return;
                k(a)
            }
            ut.errors.push(a)
        }
    }

    function R(t) {
        return function () {
            var r = arguments;
            if (!this._ty_wrap) {
                var e = F.args.apply(this, r);
                this._ty_rum = {method: e[0], url: e[1], start: s()}
            }
            try {
                return t.apply(this, r)
            } catch (n) {
                return Function.prototype.apply.call(t, this, r)
            }
        }
    }

    function L(r) {
        return "string" == typeof r ? r.length : t.ArrayBuffer && r instanceof ArrayBuffer ? r.byteLength : t.Blob && r instanceof Blob ? r.size : r && r.length ? r.length : 0
    }

    function I(r) {
        return function () {
            function e(t) {
                var r, e, n = f._ty_rum;
                if (n) {
                    if (4 !== n.readyState && (n.end = s()), n.s = f.status, "" == f.responseType || "text" == f.responseType) n.res = L(f.responseText); else if (f.response) n.res = L(f.response); else try {
                        n.res = L(f.responseText)
                    } catch (i) {
                        n.res = 0
                    }
                    if (n.readyState = f.readyState, n.cb_time = d, r = [n.method + " " + n.url, n.s > 0 ? n.end - n.start : 0, d, n.s, n.s > 0 ? 0 : t, n.res, n.req], n.r && (e = a(f), e && (e = e.xData) && (r.push(e.id), r.push(e.action), r.push(e.time && e.time.duration), r.push(e.time && e.time.qu))), j.aa.push(r), j.server.custom_urls && j.server.custom_urls.length && !ut.ct) {
                        if (!j.pattern) {
                            j.pattern = [];
                            for (var o = 0; o < j.server.custom_urls.length; o++) j.pattern.push(new RegExp(j.server.custom_urls[o]))
                        }
                        for (var o = 0; o < j.pattern.length; o++) if (n.url.match(j.pattern[o])) {
                            ut.ct = n.end + d;
                            break
                        }
                    }
                    ut.sa(), f._ty_rum = null
                }
            }

            function n() {
                4 == f.readyState && e(0)
            }

            function a(r) {
                var e;
                if (r.getResponseHeader) {
                    var n = F.parseJSON(r.getResponseHeader("X-Tingyun-Tx-Data"));
                    n && n.r && r._ty_rum && n.r + "" == r._ty_rum.r + "" && (e = {
                        name: r._ty_rum.url,
                        xData: n
                    }, ot && t._ty_rum.c_ra.push(e))
                }
                return e
            }

            function i(t) {
                return function () {
                    var r, e;
                    4 == f.readyState && f._ty_rum && (f._ty_rum.end = r = s(), f._ty_rum.readyState = 4);
                    try {
                        O && l(O), e = t.apply(this, arguments), O && p()
                    } catch (a) {
                        throw a = c(a, O), O && p(), O = null, a
                    }
                    return 4 == f.readyState && (d = s() - r), n(), e
                }
            }

            function o(t) {
                return function () {
                    var r = f._ty_rum;
                    return !r || ("progress" == t || ("abort" == t ? e(905) : "loadstart" == t ? r.start = s() : "error" == t ? e(990) : "timeout" == t && e(903), !0))
                }
            }

            function u(t, r) {
                r instanceof Array || (r = [r]);
                for (var e = 0; e < r.length; e++) {
                    var n = r[e];
                    F.sh(t, n, o(n), !1)
                }
            }

            if (!this._ty_wrap) {
                this._ty_rum.start = s(), this._ty_rum.req = arguments[0] ? L(arguments[0]) : 0;
                var f = this, d = 0, h = F.wrap(!1, this, "onreadystatechange", i);
                h || F.sh(this, "readystatechange", n, !1), u(this, ["error", "progress", "abort", "load", "loadstart", "loadend", "timeout"]), h || setTimeout(function () {
                    F.wrap(!1, f, "onreadystatechange", i)
                }, 0)
            }
            var m = function () {
                function t(t) {
                    var r = {}, e = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?/.exec(t);
                    return e && (r.protocol = e[1] ? e[1] + ":" : "http:", r.hostname = e[3], r.port = e[4] || ""), r
                }

                return function (r) {
                    var e = location;
                    if (r = F.trim(r)) {
                        if (r = r.toLowerCase(), r.startsWith("//") && (r = e.protocol + r), !r.startsWith("http")) return !0;
                        var n = t(r), a = n.protocol === e.protocol && n.hostname === e.hostname;
                        return a && (a = n.port === e.port || !e.port && ("http:" === e.protocol && "80" === n.port || "https:" === e.protocol && "443" === n.port)), a
                    }
                    return !1
                }
            }(), y = arguments;
            try {
                var v = j.server;
                v && v.id && this._ty_rum && m(this._ty_rum.url) && (this._ty_rum.r = (new Date).getTime() % 1e8, this.setRequestHeader && this.setRequestHeader("X-Tingyun-Id", v.id + ";r=" + this._ty_rum.r))
            } catch (g) {
            }
            try {
                return r.apply(this, y)
            } catch (_) {
                return Function.prototype.apply.call(r, this, y)
            }
        }
    }

    function C() {
        var r = "TINGYUN_DATA";
        if (j.agent) return j.agent;
        var e = n(r);
        if (e) {
            try {
                e = e.replace(/^"/, "").replace(/"$/, ""), e = j.agent = F.parseJSON(decodeURIComponent(e))
            } catch (i) {
            }
            a(r, "", -1e3)
        } else e = t._ty_rum && t._ty_rum.agent;
        return e
    }

    var O, q = t.XMLHttpRequest, B = document, D = Object.defineProperty, A = t.define, M = t.EventTarget, U = 0,
        $ = new RegExp("([a-z]+:/{2,3}.*):(\\d+):(\\d+)"), H = t.encodeURIComponent, z = null, F = {
            wrap: function (t, r, e, n, a) {
                try {
                    var i = r[e]
                } catch (o) {
                    if (!t) return !1
                }
                if (!i && !t) return !1;
                if (i && i._ty_wrap) return !1;
                try {
                    r[e] = n(i, a)
                } catch (o) {
                    return !1
                }
                return r[e]._ty_wrap = [i], !0
            }, unwrap: function (t, r) {
                try {
                    var e = t[r]._ty_wrap;
                    e && (t[r] = e[0])
                } catch (n) {
                }
            }, each: function (t, r) {
                if (t) {
                    var e;
                    for (e = 0; e < t.length && (!t[e] || !r(t[e], e, t)); e += 1) ;
                }
            }, mkurl: function (t, n) {
                var a = arguments, i = /^https/i.test(B.URL) ? "https" : "http";
                if (i = i + "://" + t + "/" + n + "?av=1.6.0&v=1.6.0&key=" + o(j.server.key) + "&ref=" + o(B.URL) + "&rand=" + s() + "&pvid=" + rt + "&did=" + o(r()) + "&sid=" + o(e()), "pf" !== n && j && (j.agent = C(), j.agent && j.agent.n && (i += "&n=" + o(j.agent.n))), a.length > 2) {
                    var u = a[2];
                    for (var c in u) i += "&" + c + "=" + u[c]
                }
                return X.host && (i += "&cshst=" + o(X.host)), X.url && (i += "&csurl=" + o(X.url)), i
            }, GET: function (t, r) {
                function e() {
                    r && r.apply(this, arguments), n.parentNode && n.parentNode.removeChild(n)
                }

                if (navigator && navigator.sendBeacon && V.test(t)) return navigator.sendBeacon(t, null);
                var n = B.createElement("img");
                return n.setAttribute("src", t), n.setAttribute("style", "display:none"), this.sh(n, "readystatechange", function () {
                    "loaded" != n.readyState && 4 != n.readyState || e("loaded")
                }, !1), this.sh(n, "load", function () {
                    return e("load"), !0
                }, !1), this.sh(n, "error", function () {
                    return e("error"), !0
                }, !1), B.body.appendChild(n)
            }, fpt: function (t, r, e) {
                function n(t, r, e) {
                    var n = B.createElement(t);
                    try {
                        for (var a in r) n[a] = r[a]
                    } catch (i) {
                        var o = "<" + t;
                        for (var a in r) o += " " + a + '="' + r[a] + '"';
                        o += ">", e || (o += "</" + t + ">"), n = B.createElement(o)
                    }
                    return n
                }

                var a = n("div", {style: "display:none"}, !1),
                    i = n("iframe", {name: "_ty_rum_frm", width: 0, height: 0, style: "display:none"}, !1), o = n("form", {
                        style: "display:none",
                        action: t,
                        enctype: "application/x-www-form-urlencoded",
                        method: "post",
                        target: "_ty_rum_frm"
                    }, !1), s = n("input", {name: "data", type: "hidden"}, !0);
                return s.value = r, o.appendChild(s), a.appendChild(i), a.appendChild(o), B.body.appendChild(a), o.submit(), i.onreadystatechange = function () {
                    "complete" !== i.readyState && 4 !== i.readyState || (e(null, i.innerHTML), B.body.removeChild(a))
                }, !0
            }, POST: function (r, e, n, a) {
                if (this.ie) return this.fpt(r, e, a);
                if (navigator && navigator.sendBeacon && V.test(r)) {
                    var i = navigator.sendBeacon(r, e);
                    return a(!i), i
                }
                var o;
                if (t.XDomainRequest) return o = new XDomainRequest, o.open("POST", r), o.onload = function () {
                    a(null, o.responseText)
                }, this.sh(o, "load", function () {
                    a(null, o.responseText)
                }, !1), this.sh(o, "error", function () {
                    a("POST(" + r + ")error")
                }, !1), this.wrap(!0, o, "onerror", function (t) {
                    return function () {
                        return a && a("post error", o.responseText), !0
                    }
                }), o.send(e), !0;
                if (!q) return !1;
                o = new q, o.overrideMimeType && o.overrideMimeType("text/html");
                try {
                    o._ty_wrap = 1
                } catch (s) {
                }
                var u = 0;
                o.onreadystatechange = function () {
                    4 == o.readyState && 200 == o.status && (0 == u && a(null, o.responseText), u++)
                }, o.onerror && this.wrap(!0, o, "onerror", function (t) {
                    return function () {
                        return a("post error", o.responseText), "function" != typeof t || t.apply(this, arguments)
                    }
                });
                try {
                    o.open("POST", r, !0)
                } catch (s) {
                    return this.fpt(r, e, a)
                }
                for (var c in n) o.setRequestHeader(c, n[c]);
                return o.send(e), !0
            }, sh: function (t, r, e, n) {
                return t.addEventListener ? t.addEventListener(r, e, n) : !!t.attachEvent && t.attachEvent("on" + r, e)
            }, args: function () {
                for (var t = [], r = 0; r < arguments.length; r++) t.push(arguments[r]);
                return t
            }, stringify: i, parseJSON: function (r) {
                if (r && "string" == typeof r) {
                    var e = t.JSON ? t.JSON.parse : function (t) {
                        return new Function("return " + t)()
                    };
                    return e(r)
                }
                return null
            }, trim: Z ? function (t) {
                return null == t ? "" : Z.call(t)
            } : function (t) {
                return null == t ? "" : t.toString().replace(/^\s+/, "").replace(/\s+$/, "")
            }, extend: function (t, r) {
                if (t && r) for (var e in r) r.hasOwnProperty(e) && (t[e] = r[e]);
                return t
            }, bind: function (t, r) {
                return function () {
                    return t.apply(r, arguments)
                }
            }
        }, X = {}, j = t._ty_rum = t.TINGYUN = F.extend({
            st: s(), ra: [], c_ra: [], aa: [], snd_du: function () {
                return this.server.adu ? 1e3 * this.server.adu : 1e4
            }, cc: function () {
                return this.server.ac ? this.server.ac : 10
            }, config: function (t, r) {
                var e;
                if ("object" == typeof t) e = t; else {
                    if ("string" != typeof t || void 0 === r) throw new Error("illegal arguments");
                    e = {}, e[t] = r
                }
                for (var n in e) X[n] = e[n];
                return this
            }
        }, t._ty_rum || {});
    var ty_rum = j;
    ty_rum.server = {
        id: 'EZGDj0mIrrE',
        ignore_err: true,
        beacon: 'beacon.tingyun.com',
        beacon_err: 'beacon-err.tingyun.com',
        key: 'j1Xjmbk_A3c',
        trace_threshold: 7000,
        fp_threshold: 2000,
        fs_threshold: 4000,
        dr_threshold: 4000,
        custom_urls: [],
        sr: 1.0
    };
    if (j.server && !(j.server.sr && Math.random() >= j.server.sr)) {
        var G = {fp_threshold: 2e3, fs_threshold: 4e3, dr_threshold: 4e3}, J = F.extend(G, j.server), W = "ignore_err",
            Y = !(W in j.server) || j.server[W], Z = String.prototype.trim;
        String.prototype.startsWith || (String.prototype.startsWith = function (t, r) {
            return r = r || 0, this.indexOf(t, r) === r
        });
        var K, Q, V = /^http/i, tt = function () {
            function t(t) {
                return t < 0 ? NaN : t <= 30 ? 0 | Math.random() * (1 << t) : t <= 53 ? (0 | Math.random() * (1 << 30)) + (0 | Math.random() * (1 << t - 30)) * (1 << 30) : NaN
            }

            function r(t, r) {
                for (var e = t.toString(16), n = r - e.length, a = "0"; n > 0; n >>>= 1, a += a) 1 & n && (e = a + e);
                return e
            }

            return function () {
                return r(t(32), 8) + "-" + r(t(16), 4) + "-" + r(16384 | t(12), 4) + "-" + r(32768 | t(14), 4) + "-" + r(t(48), 12)
            }
        }(), rt = tt(), et = "TY_DISTINCT_ID", nt = "TY_SESSION_ID", at = function () {
            try {
                return localStorage.setItem(rt, rt), localStorage.removeItem(rt), !0
            } catch (t) {
                return !1
            }
        }();
        at ? (K = F.bind(localStorage.getItem, localStorage), Q = F.bind(localStorage.setItem, localStorage)) : (K = n, Q = a);
        try {
            D && D(t, "define", {
                get: function () {
                    return A
                }, set: function (t) {
                    "function" == typeof t && (t.amd || t.cmd) ? (A = function () {
                        var r = F.args.apply(this, arguments);
                        if (3 !== r.length) return t.apply(this, r);
                        var e = "string" == typeof r[0] ? r[0] : "anonymous";
                        return t.apply(this, u(r, function (t, r, e) {
                            var n;
                            try {
                                O = e, d(e), n = t.apply(this, r), h()
                            } catch (a) {
                                throw h(), c(a, e)
                            }
                            return n
                        }, e))
                    }, F.extend(A, t)) : A = t
                }, configurable: !0
            })
        } catch (it) {
        }
        var ot = t.performance ? t.performance : t.Performance;
        ot && (F.sh(ot, "resourcetimingbufferfull", function () {
            var t = ot.getEntriesByType("resource");
            t && (j.ra = j.ra.concat(t), ot.clearResourceTimings())
        }, !1), F.sh(ot, "webkitresourcetimingbufferfull", function () {
            var t = ot.getEntriesByType("resource");
            t && (j.ra = j.ra.concat(t), ot.webkitClearResourceTimings())
        }, !1));
        for (var st = "", ut = j.metric = {
            ready: function () {
                return j.load_time
            }, initend: function () {
                function t() {
                    ut.sa()
                }

                j.end_time || (j.end_time = s(), this._h = setInterval(t, 2e3))
            }, send: function () {
                function r() {
                    function r(t) {
                        return n[t] > 0 ? n[t] - a : 0
                    }

                    var e = {};
                    if (ot && ot.timing) {
                        var n = ot.timing;
                        a = n.navigationStart;
                        var i = r("domainLookupStart"), s = r("domainLookupEnd"), u = r("redirectStart"),
                            c = r("redirectEnd"), f = r("connectStart"), l = r("connectEnd");
                        e = {
                            f: r("fetchStart"),
                            qs: r("requestStart"),
                            rs: r("responseStart"),
                            re: r("responseEnd"),
                            os: r("domContentLoadedEventStart"),
                            oe: r("domContentLoadedEventEnd"),
                            oi: r("domInteractive"),
                            oc: r("domComplete"),
                            ls: r("loadEventStart"),
                            le: r("loadEventEnd"),
                            tus: r("unloadEventStart"),
                            tue: r("unloadEventEnd"),
                            ressize: !0
                        }, l - f > 0 && (e.cs = f, e.ce = l), s - i > 0 && (e.ds = i, e.de = s), (c - u > 0 || c > 0) && (e.es = u, e.ee = c), 0 == e.le && (e.ue = j.load_time - a);
                        var p;
                        if (n.msFirstPaint) p = n.msFirstPaint; else if (t.chrome && chrome.loadTimes) {
                            var d = chrome.loadTimes();
                            d && d.firstPaintTime && (p = 1e3 * d.firstPaintTime)
                        } else j.firstPaint && (p = j.firstPaint);
                        p && (e.fp = Math.round(p - a), j.firstPaint = e.fp), n.secureConnectionStart && (e.sl = r("secureConnectionStart"))
                    } else e = {t: a, os: j.end_time - a, ls: j.load_time - a, ressize: !1};
                    e.je = ut.errors.length, ut.ct && (e.ct = ut.ct - a), ut.touch && (e.fi = ut.touch - a);
                    var h = C();
                    return h && (e.id = o(h.id), e.a = h.a, e.q = h.q, e.tid = o(h.tid), e.n = o(h.n)), e.sh = t.screen && t.screen.height, e.sw = t.screen && t.screen.width, e
                }

                function e(r) {
                    var e = t._ty_rum.c_ra;
                    if (r) for (var n = e.length - 1; n >= 0; n--) if (r.indexOf(e[n].name) > -1) return e[n].xData;
                    return null
                }

                function n(t) {
                    function r(t) {
                        return p[t] > 0 ? p[t] : 0
                    }

                    var n = "1", i = "0";
                    if (st += v() >= J.fp_threshold ? n : i, st += g() >= J.fs_threshold ? n : i, st += _() >= J.dr_threshold ? n : i, st += t >= j.server.trace_threshold ? n : i, !y()) return null;
                    var s = ot;
                    if (s && s.getEntriesByType) {
                        var u = {tr: !0, tt: o(B.title), charset: B.characterSet}, c = j.ra,
                            f = s.getEntriesByType("resource");
                        f && (c = c.concat(f), s.clearResourceTimings ? s.clearResourceTimings() : s.webkitClearResourceTimings && s.webkitClearResourceTimings()), u.res = [];
                        for (var l = 0; l < c.length; l++) {
                            var p = c[l], d = {
                                o: r("startTime"),
                                rt: p.initiatorType,
                                n: p.name,
                                f: r("fetchStart"),
                                ds: r("domainLookupStart"),
                                de: r("domainLookupEnd"),
                                cs: r("connectStart"),
                                ce: r("connectEnd"),
                                sl: r("secureConnectionStart"),
                                qs: r("requestStart"),
                                rs: r("responseStart"),
                                re: r("responseEnd"),
                                ts: p.transferSize || 0,
                                es: p.encodedBodySize || 0
                            }, h = e(p.name);
                            h && (d.aid = h.id, d.atd = h.trId, d.an = h.action, d.aq = h.time && h.time.qu, d.as = h.time && h.time.duration), u.res.push(d)
                        }
                        if (ut.errors.length) {
                            u.err = [];
                            for (var l = 0, m = ut.errors, S = m.length; l < S; l++) u.err.push({
                                o: Math.round(m[l][0] - a),
                                e: m[l][1] && m[l][1].replace(/([\"\\])/g, "\\$1").replace(/\n/g, "\\n"),
                                l: m[l][2],
                                c: m[l][3],
                                r: m[l][4],
                                ec: S,
                                s: m[l][5],
                                m: m[l][6],
                                ep: m[l][7]
                            })
                        }
                        return u
                    }
                    return null
                }

                if (this.sended) return !1;
                if (!this.ready()) return !1;
                var a = j.st, i = {};
                try {
                    var u = r();
                    i = n(u.ls > 0 ? u.ls : j.load_time - a);
                    var c = {trflag: st || "0000", fp: j.firstPaint, fs: j.fs, dr: j.dr};
                    F.extend(u, c)
                } catch (f) {
                }
                i = i ? F.stringify(i) : "";
                var l = F.mkurl(j.server.beacon, "pf", u);
                z = s(), 0 != i.length && F.POST(l, i, {}, m("POST")) || F.GET(l);
                var p = F.bind(S, this);
                return p(), setInterval(p, 1e4), this.sended = !0, this.sa(1), !0
            }, sa: function (t) {
                (this.ready() || t) && (t || (t = !this._last_send || s() - this._last_send > j.snd_du() || j.aa.length >= j.cc()), j.aa.length > 0 && t && (this._last_send = s(), F.POST(F.mkurl(j.server.beacon, "xhr"), F.stringify({xhr: j.aa}), {}, m("POST")), j.aa = []))
            }, errors: []
        }, ct = null, ft = {}, lt = [["load", E], ["beforeunload", b], ["pagehide", b], ["unload", b]], pt = 0; pt < lt.length; pt++) F.sh(t, lt[pt][0], lt[pt][1], !1);
        t.addEventListener ? F.sh(t, "error", P, !1) : t.onerror = function (t, r, e, n, a) {
            if (r || !Y) {
                var i = [s(), t, e, n, r == B.URL ? "#" : r], o = N(t, e, n, a && a.moduleName);
                i = i.concat([a && a.stack, a && a.moduleName, ft[o] ? 0 : 1]), ft[o] = !0, k(i), ut.errors.push(i)
            }
        };
        for (var dt = [["scroll", x], ["keypress", x], ["click", x], ["DOMContentLoaded", T], ["readystatechange", w]], pt = 0; pt < dt.length; pt++) F.sh(B, dt[pt][0], dt[pt][1], !1);
        if (F.wrap(!1, t, "requestAnimationFrame", function (r) {
                return function () {
                    return j.firstPaint = s(), t.requestAnimationFrame = r, r.apply(this, arguments)
                }
            }), q) if (q.prototype) F.wrap(!1, q.prototype, "open", R), F.wrap(!1, q.prototype, "send", I); else {
            F.ie = 7;
            var ht = q;
            t.XMLHttpRequest = function () {
                var t = new ht;
                return F.wrap(!1, t, "open", R), F.wrap(!1, t, "send", I), t
            }
        } else t.ActiveXObject && (F.ie = 6)
    }
}(window);