Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1A22B41
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 07:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C170D8919F;
	Mon, 20 May 2019 05:42:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54B48919F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 05:42:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 22:42:15 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2019 22:42:14 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH 0/2] Introduce set_ggtt_entry event point
Date: Mon, 20 May 2019 13:36:47 +0800
Message-Id: <20190520053649.5906-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2V0X2dndHRfZW50cnkgZXZlbnQgcG9pbnQgY2FuIGhlbHAgdG8gdHJhY2UgdGhlIGdndHQgZW50
cnkgdmFsdWVzIHNldApieSBHVlQtZy4gV2l0aCB0aGUgaGVscCBvZiBzZXRfZ2d0dF9lbnRyeSwg
YSBidWcgZmlsbGluZyBndWVzdCBnZ3R0CmVudHJ5IHdpdGggc3RhY2sgZ3JhYmFnZSB2YWx1ZSBp
cyBmaXhlZC4KClRpbmEgWmhhbmcgKDIpOgogIGRybS9pOTE1L2d2dDogQWRkIHNldF9nZ3R0X2Vu
dHJ5IHRyYWNpbmcgZXZlbnQKICBkcm0vaTkxNS9ndnQ6IEluaXRpYWxpemUgaW50ZWxfZ3Z0X2d0
dF9lbnRyeSBpbiBzdGFjawoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgIHwgIDgg
KysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oIHwgMTkgKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
