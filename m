Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07510ECD3
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Dec 2019 17:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866926E228;
	Mon,  2 Dec 2019 16:06:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE666E22C;
 Mon,  2 Dec 2019 16:06:20 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19430312-1500050 for multiple; Mon, 02 Dec 2019 16:06:15 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <bdd0c16b8e2a37589a67e43c70a507001e0e5d27.1575302334.git.jani.nikula@intel.com>
References: <cover.1575302334.git.jani.nikula@intel.com>
 <bdd0c16b8e2a37589a67e43c70a507001e0e5d27.1575302334.git.jani.nikula@intel.com>
Message-ID: <157530277477.27263.6028188613442603598@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915/gvt: use intel uncore
 functions for forcewake register access
Date: Mon, 02 Dec 2019 16:06:14 +0000
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0xMi0wMiAxNjowMDo0OSkKPiBNb3ZlIGF3YXkgZnJv
bSBJOTE1X1JFQURfRlcoKSBhbmQgSTkxNV9XUklURV9GVygpIGFuZCBzd2l0Y2ggdG8gdXNpbmcK
PiBpbnRlbF91bmNvcmVfcmVhZF9mdygpIGFuZCBpbnRlbF91bmNvcmVfd3JpdGVfZncoKSwgcmVz
cGVjdGl2ZWx5LgoKSSd2ZSBhIHBhdGNoIHRvIHN3aXRjaCBndnQgb3ZlciB0byB1c2luZyBndC0+
dW5jb3JlLCBndC0+ZW5naW5lcyBldGMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
