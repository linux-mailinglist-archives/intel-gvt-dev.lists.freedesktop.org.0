Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335371384A2
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 12 Jan 2020 04:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9736E2EF;
	Sun, 12 Jan 2020 03:15:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sun, 12 Jan 2020 03:15:00 UTC
Received: from mail3-bck.iservicesmail.com (mail3-bck.iservicesmail.com
 [217.130.24.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2080C6E2EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 12 Jan 2020 03:14:59 +0000 (UTC)
IronPort-SDR: PHneH2p4qJTw9V0kHfmtWAnZBFCAIVIRjEu6Rm6h/e1UEV2/SL7KbiDI/vz3Aah0LOKW77ODk7
 JEJsEcCM0ruA==
IronPort-PHdr: =?us-ascii?q?9a23=3APh+A0Rw63eh0ZgzXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2usRIJqq85mqBkHD//Il1AaPAdyAraga1aGL7+jJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe61+IRS3oAnetsQbjpZpJ7osxB?=
 =?us-ascii?q?fOvnZGYfldy3lyJVKUkRb858Ow84Bm/i9Npf8v9NNOXLvjcaggQrNWEDopM2?=
 =?us-ascii?q?Yu5M32rhbDVheA5mEdUmoNjBVFBRXO4QzgUZfwtiv6sfd92DWfMMbrQ704RS?=
 =?us-ascii?q?iu4qF2QxPujysJKiI2/3vSis1wla5WvhWhpwZnw47TeoGaLuZ+cb3EcdwEQ2?=
 =?us-ascii?q?pNR9pcVzBdAoymc4QPD/QOPeNGoIn7u1sCtAWxBQ+1CO3ozT9IgGH53K0j3+?=
 =?us-ascii?q?s/FwHNwQgsEtwSvHjIqdn4MroZX+Kow6nS1TjNYfNY2S3j5obLbx4uru2DU7?=
 =?us-ascii?q?1rfMrNy0QgCx/JgkmMpYD7OT6ey+QDs3Kc7+plTe+hkXAoqx1vrTi128wjio?=
 =?us-ascii?q?7JhoQaylvZ8ih52Jg6JcGmR05hb9+kF51Qty6BOot2WcMtWH1ntDwmxb0BvJ?=
 =?us-ascii?q?63ZigKyJc+yhPZdveJcJCI7wr9WOqMIzp0nm9pdbyjixqo70StxffwW8e03V?=
 =?us-ascii?q?tMsyFLiMPDtmoX2BzW8sWHT/x98Vq/1juXzADT7/1EIVgzlarGN54t2r4wmY?=
 =?us-ascii?q?QXsUTEBiL2nV/5jK6SdkU+5Oeo7/jrb7r8qp+CMI97lxvxMqopmsy5H+s0KB?=
 =?us-ascii?q?YBX3OD9eS90r3s41H5Ta1UgvErkKTVqo3WKMoHqqKjHQNY3Zwv5hi/Aju+1d?=
 =?us-ascii?q?QXh3gHLFZLeBKdiIjpPknDIOjmAvejnVusijlqx/fAPr3uGZjNLmPDn6z9cr?=
 =?us-ascii?q?pn90Fczw8zwcpf55JXEr0BOu78WlfttNzECR80Kw20w+D7CNpj0oMSQG2PAr?=
 =?us-ascii?q?GFMK/LrFCH+PwvLvKIZI8Uozb9N+Ml6+TgjX8jh1ASY7Sm0oUMaHC7AvRmJF?=
 =?us-ascii?q?2ZbWDrgtcbHmdZ9jY5Ge3slFCGFDFNezO+UrwU4jAgFJngA53OS4ygm7+d2z?=
 =?us-ascii?q?/9GYdZNVpLElSdLXC9T4iYVu1EVyWULYc1ijEYWKK+TIku1RKurwXx47ViJ+?=
 =?us-ascii?q?vQvCYfsMSw+sJy4rjrmA0/73RLCMKSmzWVQn15hHwPQTAe3Lt1qgp2zVLF0a?=
 =?us-ascii?q?su0K8QLsBa+/4cC1RyDpXb1eEvUIiqVw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EzAwDqjBpelyMYgtlMGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwEDBAGBJYFNUiASk1CBTR+?=
 =?us-ascii?q?DQ4tjgQCDHhWGBxQMgVsNAQEBAQE1AgEBhEBOAReBDyQ1CA4CAw0BAQUBAQE?=
 =?us-ascii?q?BAQUEAQECEAEBAQEBBhgGhXOCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUoMQAE?=
 =?us-ascii?q?OAVODBIJLAQEznXQBjQQNDQKFHYJIBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAG?=
 =?us-ascii?q?CAYJ/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4E?=
 =?us-ascii?q?JiAOEToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EzAwDqjBpelyMYgtlMGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwEDBAGBJYFNUiASk1CBTR+DQ4tjgQCDHhWGB?=
 =?us-ascii?q?xQMgVsNAQEBAQE1AgEBhEBOAReBDyQ1CA4CAw0BAQUBAQEBAQUEAQECEAEBA?=
 =?us-ascii?q?QEBBhgGhXOCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUoMQAEOAVODBIJLAQEzn?=
 =?us-ascii?q?XQBjQQNDQKFHYJIBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIg?=
 =?us-ascii?q?lkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXd?=
 =?us-ascii?q?AGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,423,1571695200"; d="scan'208";a="323148011"
Received: from mailrel04.vodafone.es ([217.130.24.35])
 by mail02.vodafone.es with ESMTP; 12 Jan 2020 04:09:53 +0100
Received: (qmail 10763 invoked from network); 12 Jan 2020 03:08:05 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
 (envelope-sender <peterwong@hsbc.com.hk>)
 by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
 for <intel-gvt-dev@lists.freedesktop.org>; 12 Jan 2020 03:08:05 -0000
Date: Sun, 12 Jan 2020 04:08:04 +0100 (CET)
From: Peter Wong <peterwong@hsbc.com.hk>
To: intel-gvt-dev@lists.freedesktop.org
Message-ID: <27299165.109928.1578798485255.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
