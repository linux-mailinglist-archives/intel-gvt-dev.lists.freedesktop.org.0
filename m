Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999775298F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jul 2023 19:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C48B10E71A;
	Thu, 13 Jul 2023 17:11:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CDD10E71A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jul 2023 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689268258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UPgPFBGvQHuZjwqO9ik4oPicS3MZwipCdBIqa3Pous=;
 b=LHBIbLliDKDDmYw7l40xAIkKcxNlDijO19/zJ465217OF1HzS0u0R/g1RtVur8+t5gyq2l
 UjujD9fa1P2aRBj54zQPh8Xu/rl0I8KHLhmN42Kk6hpMycqm5h7Neh0caqiMrXj/n2fDNO
 1VZ53nwpwqoqWvSzrovy/KLZVCl4YbE=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-KFa-hdPLPjGcyGXq1W3NHA-1; Thu, 13 Jul 2023 13:10:57 -0400
X-MC-Unique: KFa-hdPLPjGcyGXq1W3NHA-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-345fe8d0a30so4601455ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jul 2023 10:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689268257; x=1691860257;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+UPgPFBGvQHuZjwqO9ik4oPicS3MZwipCdBIqa3Pous=;
 b=H/Z6GAn7u6AU+Z1PiSdZZXOYeuHTBEQKbCg8f7jg2j2wA5rK+Fmy1T33/5zA15lbJA
 Z8940oMn450YCXCoKxY111CrL7qAZXP5iFgV2UcBL0HtF2sNmyX7xoXYMY7KcgSAaDis
 Lt1by0IAeMH4PBRXb0B0HKVpd8S7PkXb3IawCpUIGJDBrsfoBV/NXoxYZory0IMK5LDK
 7iAXUderwxIVTEERFD2E42qTAiWAn4IL+rFFBpBRtkF7l8OMH7nS9L3kzRGCT6vl/nVZ
 75nBfhO08uG80fkdiY1EDNuXTK1/PlFTO+fm8d5PEuIQVCDhCoMrtTBFsb6obCth2zhp
 L9CQ==
X-Gm-Message-State: ABy/qLY0uX8TAcvmv+vUO3CsgWMp03A1P9wJ97MPdjpuahhG652BHQQn
 hZkL6uYp4YnmXoQD3jPiznrlxCrJtx5A6caBj9KdOvWKyBmaXWxki1Q3fU1I9d1E60RpQ/om+rw
 Pjz9ynkTsGa6kdAF4sQ6I6uqR/a2q1oRjCA==
X-Received: by 2002:a92:c105:0:b0:345:6ffa:63c5 with SMTP id
 p5-20020a92c105000000b003456ffa63c5mr1980588ile.32.1689268257119; 
 Thu, 13 Jul 2023 10:10:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEYzBd2cy5+vbqrqBW5hcL0Nlt03XvoKU7EVc2Oqt6qt/39DAJLG7+eJes4a+aimrEVLy/slQ==
X-Received: by 2002:a92:c105:0:b0:345:6ffa:63c5 with SMTP id
 p5-20020a92c105000000b003456ffa63c5mr1980544ile.32.1689268256865; 
 Thu, 13 Jul 2023 10:10:56 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 el20-20020a0566384d9400b0042b61a5087csm1948085jab.132.2023.07.13.10.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:10:56 -0700 (PDT)
Date: Thu, 13 Jul 2023 11:10:54 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <20230713111054.75cdf2b8.alex.williamson@redhat.com>
In-Reply-To: <20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org>
References: <20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org>
Organization: Red Hat
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, jaz@semihalf.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Xu Yilun <yilun.xu@intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, netdev@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Benjamin LaHaise <bcrl@kvack.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 12:05:36 +0200
Christian Brauner <brauner@kernel.org> wrote:

> Hey everyone,
> 
> This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
> by removing the count argument which is effectively unused.

We have a patch under review which does in fact make use of the
signaling value:

https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com/

Thanks,
Alex

