Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F12165E1B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Feb 2020 14:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0726ED76;
	Thu, 20 Feb 2020 13:04:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF4A6ED76
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Feb 2020 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0jzXoAIJsbNLKe2t4d3wk51xq79LbG9WhZDrOomPBuY=; b=bq+tpv9t4ChNAo5JK5UTkEX83
 0sFnpmvRXGSPDDiu+DCzNiNi5WVoxRHc9xe8ivFIuIjz7dkmst5wvYcror1X3kX1P9RYY+oSfINv9
 nQrKQ2X8rnu7qPpQ3unr2lnXBGgKCv8nW4oPpsWZbaHFmhkXXGxsQJ3/jnux8XE1jo6/w/GDlaByn
 FBXajM4zAAverG3oOJltosgkMOz3EQSDopCRVOQHBzTvxFPQbDq1kz4O8gK2S4pvqw4F6NBVIj0u6
 cH1AFlONZ6jFQJdPLo1bNPIoWzc8CMata4I+FZ4payePsIM8hJwidfP8/yTeU84nk6UipwSzVgKnG
 YjPppCiJA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j4lUs-0008OL-Gs; Thu, 20 Feb 2020 14:04:07 +0100
Received: from [2a02:8106:231:700:6975:3446:3ada:292d]
 (helo=localhost.localdomain)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1j4lUs-000DFW-AW; Thu, 20 Feb 2020 14:04:06 +0100
Message-ID: <b890a3ee8bb81710b65fa4c5d66bfc62f0c59021.camel@cyberus-technology.de>
Subject: EDID / guest resolution handling
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Date: Thu, 20 Feb 2020 14:04:05 +0100
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25728/Wed Feb 19 15:06:20 2020)
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
Cc: Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>,
 Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello,

we wondering what the best way is to handle different guest resolutions.
Specifically, we are looking into adding "normal" FullHD resolution (1920x1080)
to guests. 

At the moment, we do this by adding another vGPU type. This is certainly
possible, but it seems a more flexible approach is to give the VMM control over
the EDID information exposed to guests.

Is there anything that speaks against uploading the EDID from the VMM?

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
