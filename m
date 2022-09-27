Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33895ECDDA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Sep 2022 22:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50910E033;
	Tue, 27 Sep 2022 20:07:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE210E033
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 20:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664309261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9KCspW5QBpvFaoYn48TLwQ3ngMOEiqEbJfDsVhYYhY=;
 b=g47thuQcFgDzKbdnvZrIEjlam4UIAIkHheaVCZq5NMX5vxsahv8jGOMcfKz3zVFw3EEkcf
 x5pEKkqn415Prg5Fy7pWtrfdP6e0/xE7YTUV99PWeQPjCBDfwYKr5AvTGNLwdZMLgR3k3I
 ehOBzTkukdSPpZIyIdZdtgBgrLHwsko=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-Lm3O8yQ4Mb2fr1juDWKKcA-1; Tue, 27 Sep 2022 16:07:39 -0400
X-MC-Unique: Lm3O8yQ4Mb2fr1juDWKKcA-1
Received: by mail-io1-f69.google.com with SMTP id
 e9-20020a6b7309000000b006a27af93e45so6459818ioh.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 13:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i9KCspW5QBpvFaoYn48TLwQ3ngMOEiqEbJfDsVhYYhY=;
 b=qivlcjz/+gtz8fS44TCYGFkcYYqkKMig6W64ATyGDBblCx3dQQdeBAs0ryMnTaU1Os
 krDoZ096Sae4KKPgvAdwjAtyp+ZVT2+5s4QkTPBDkqhDckvPvsZZ9V2wkxR/05dXcwc7
 2s+ToLpanSOUbi1zql62Jdd27zVxfLDwYEx+IjVl1agFujSRLj6HScGEsTSGzfgkl6Km
 5E+CcZi7Y+GN066KDY4ceTAobpNMarpgWUBJB1/YyDkwdYZYPp+nIm0edyAfcivbcmmZ
 QQzyp4L5BghlT3SKmZtHn6vQleR87l5hDpG+dt4QC2CZ6DjHOiWFr7VYI1gSLqGDt09o
 7x6Q==
X-Gm-Message-State: ACrzQf16bUXBqO4E4DylOl6KKbG55/U5axk1a9DfZPnkW6WZ2JEBX0pa
 Gd0UmZLFrE6URKgf/FiCdH4QJeWyJVa6uj+4bk03KE4SsDjXnYKoeuFmKf2zvrtJp5XYvwj50WJ
 6iIQ6qkv1lgyG59LXveEtMkS0+1JOh/t2ug==
X-Received: by 2002:a05:6e02:164d:b0:2f1:869c:c45b with SMTP id
 v13-20020a056e02164d00b002f1869cc45bmr12241789ilu.212.1664309259227; 
 Tue, 27 Sep 2022 13:07:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lK3WbPrzD44Iq58D1vNhjr5XwGPbVXBbULBMbNnjK3x4PVL86wB1/1VUMJJsx+kK4SSdmYA==
X-Received: by 2002:a05:6e02:164d:b0:2f1:869c:c45b with SMTP id
 v13-20020a056e02164d00b002f1869cc45bmr12241776ilu.212.1664309259048; 
 Tue, 27 Sep 2022 13:07:39 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m20-20020a02a154000000b00346b96a352bsm963856jah.164.2022.09.27.13.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 13:07:38 -0700 (PDT)
Date: Tue, 27 Sep 2022 14:07:37 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220927140737.0b4c9a54.alex.williamson@redhat.com>
In-Reply-To: <20220923092652.100656-1-hch@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 23 Sep 2022 11:26:38 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> this series significantly simplifies the mdev driver interface by
> following the patterns for device model interaction used elsewhere in
> the kernel.
> 
> Changes since v7:
>  - rebased to the latests vfio/next branch
>  - move the mdev.h include from cio.h to vfio_ccw_private.h
>  - don't free the parent in mdev_type_release
>  - set the pretty_name for vfio_ap
>  - fix the available_instances check in mdev_device_create

Thanks for your persistence, I think all threads are resolved at this
point.  Applied to vfio next branch for v6.1.  Thanks,

Alex

